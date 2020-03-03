package it.univaq.se4as.project.ih.planner.mqtt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.script.Bindings;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import it.univaq.se4as.project.ih.api.Probe;
import it.univaq.se4as.project.ih.api.Script;
import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;
import it.univaq.se4as.project.ih.planner.PlannerActivator;

public class PlannerBrokerCallback implements MqttCallback {
	private PlannerActivator activator; 
	private MqttClient client;
	public ExecutorService pool = Executors.newFixedThreadPool(10); 
	private ScriptEngine engine = new ScriptEngineManager().getEngineByName("nashorn");
	
	public PlannerBrokerCallback(PlannerActivator activator) throws Exception {
		this.activator = activator;
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.setCallback(this);
		client.connect();
		client.subscribe(MQTTParams.PLANNER_TOPIC);
		System.out.printf("[IntelligentHome:PlannerBroker] Listening data from topic [%s] on host [%s]/[%s]\n", MQTTParams.EXECUTOR_TOPIC, MQTTParams.MQTT_HOST, getClass().getName());
	}
	
	@Override
	public void connectionLost(Throwable ex) {
		System.err.println("[IntelligentHome:PlannerBroker] The connection with the server is lost. !!!! "+ex);
		try {
			activator.reconnect();
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:PlannerBroker] Reconnection failed");
		}
	}

	@Override
	public void deliveryComplete(IMqttDeliveryToken token) {
		System.out.println("[IntelligentHome:PlannerBroker] The delivery has been complete. The delivery token is: " + token);
	}

	@Override
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		String sMessage = message.toString();
		System.out.println("[IntelligentHome:PlannerBroker] A new message arrived from the topic: \"" + topic + "\". The payload of the message is " + sMessage);	
		try {	
			String[] msgParts = sMessage.split(":");
			String command = msgParts[0];
			String sensorName = msgParts[1];
			String value = msgParts[2];
			switch(command) {
				case "DATA": {
					Runnable runnable = () -> { 
						try {							
							Map<String, Probe> sensorMap = activator.getHistory().getLastSensorValues();
							
							List<Script> scriptList = getScriptsToBeExecuted(sensorName);
							
							for(Script s : scriptList) {
								Bindings env = engine.createBindings();
								
								// add base bindings
								env.put("UNCHANGED", "UNCHANGED");
								env.put("ON", "true");
								env.put("OPEN", "true");
								env.put("OFF", "false");
								env.put("CLOSE", "false");
								
								for(String sens : s.getSensors()) {
									Probe p = sensorMap.get(sens);
									System.out.print("[IntelligentHome:PlannerBroker] Binding Sensor "+sens+" with probe "+p);	
									env.put(sens, (p!=null) ? p.getValue() : "");
								}
								for(String act : s.getActuators()) {
									env.put(act, "");
								}
								
								System.out.print("[IntelligentHome:PlannerBroker] Executing script '"+s.getName()+"'...");
								engine.eval(s.getScript(), env);
								System.out.println("DONE!");
								
								System.out.println("[IntelligentHome:PlannerBroker] ****** Output Environment - START ******");
								for(String k : env.keySet()) {
									System.out.println("[IntelligentHome:PlannerBroker] Var ["+k+"] = ["+env.get(k)+"]");
								}
								System.out.println("[IntelligentHome:PlannerBroker] ****** Output Environment - END   ******");
								
								for(String act : s.getActuators()) {
									Object v = env.get(act);
									if(!"UNCHANGED".equalsIgnoreCase(String.valueOf(v))) {
										MqttMessage outMsg = new MqttMessage((act+":"+v).getBytes());
										client.publish(MQTTParams.EXECUTOR_TOPIC, outMsg);
										System.out.println("[IntelligentHome:PlannerBroker] Published "+outMsg+" to topic ["+MQTTParams.EXECUTOR_TOPIC+"]");
									}
									else {
										System.out.println("[IntelligentHome:PlannerBroker] UNCHANGED value from script. Skipping.");
									}
								}
							}
						}
						catch(ScriptException se) {
							System.err.println("[IntelligentHome:PlannerBroker]:Thread Error executing script! "+se);	
						}
						catch(MqttException me) {
							System.err.println("[IntelligentHome:PlannerBroker]:Thread Message is unreadable! "+me);							
						}
						catch(Exception e) {
							System.err.println("[IntelligentHome:PlannerBroker]:Thread Unexpected exception! "+e);
							e.printStackTrace();
						}
					};
					
					pool.execute(runnable);
				}
				case "NOTIFY": {
					if("PROBE".equalsIgnoreCase(sensorName)) {
						System.out.print("[IntelligentHome:PlannerBroker] Analyer PROBE message: "+sMessage);
						String outMsg = "LCD:"+sMessage.split(":")[1]+" OFFLINE!";
						System.out.print("[IntelligentHome:PlannerBroker] Sendig command to LCD");
						client.publish(MQTTParams.EXECUTOR_TOPIC, new MqttMessage(outMsg.getBytes()));
						return;
					}
					else {
						System.out.print("[IntelligentHome:PlannerBroker] Generic notify message: "+sMessage);
						String outMsg = "LCD:"+sensorName+" "+value;
						System.out.print("[IntelligentHome:PlannerBroker] Sendig command to LCD");
						client.publish(MQTTParams.EXECUTOR_TOPIC, new MqttMessage(outMsg.getBytes()));
						return;
					}
				}
				case "ERROR": {
					System.out.print("[IntelligentHome:PlannerBroker] Error message: "+sMessage);
					String outMsg = "LCD:"+value;
					System.out.print("[IntelligentHome:PlannerBroker] Sendig command to LCD");
					client.publish(MQTTParams.EXECUTOR_TOPIC, new MqttMessage(outMsg.getBytes()));
					return;
				}
			}
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:PlannerBroker] Message is unreadable! "+e);
			e.printStackTrace();
		}
	}
	
	private List<Script> getScriptsToBeExecuted(String sensorName) {
		List<Script> lScripts = new ArrayList<>();
		
		Map<String, Script> scripts = activator.scripts;
		for(String name : scripts.keySet()) {
			Script s = scripts.get(name);
			if(s.getSensors().contains(sensorName)) {
				lScripts.add(s);
			}
		}
		
		return lScripts;
	}
}
