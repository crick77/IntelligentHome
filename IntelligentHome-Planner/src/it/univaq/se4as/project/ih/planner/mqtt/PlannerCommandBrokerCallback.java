package it.univaq.se4as.project.ih.planner.mqtt;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;
import it.univaq.se4as.project.ih.planner.PlannerActivator;

public class PlannerCommandBrokerCallback implements MqttCallback {
	private final static Integer ALL_SCRIPTS = null;
	private PlannerActivator activator; 
	private MqttClient client;

	public PlannerCommandBrokerCallback(PlannerActivator activator) throws Exception {
		this.activator = activator;
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.setCallback(this);
		client.connect();
		client.subscribe(MQTTParams.UPDATER_TOPIC);
		System.out.printf("[IntelligentHome:PlannerCmdBroker] Listening data from topic [%s] on host [%s]/[%s]\n", MQTTParams.UPDATER_TOPIC, MQTTParams.MQTT_HOST, getClass().getName());
	}
	
	@Override
	public void connectionLost(Throwable ex) {
		System.err.println("[IntelligentHome:PlannerCmdBroker] The connection with the server is lost. !!!! "+ex);
		try {
			activator.reconnectUpdater();
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:PlannerCmdBroker] Reconnection failed");
		}
	}

	@Override
	public void deliveryComplete(IMqttDeliveryToken arg0) {	
	}

	@Override
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		String sMessage = message.toString();
		System.out.println("[IntelligentHome:PlannerCmdBroker] A new message arrived from the topic: \"" + topic + "\". The payload of the message is " + sMessage);	
		try {	
			String[] msgParts = sMessage.split(":");
			if(msgParts.length==3) { 
				String module = String.valueOf(msgParts[0]).toUpperCase();
				if("PLANNER".equalsIgnoreCase(module)) {
					String command = String.valueOf(msgParts[1]).toUpperCase();
					String action = String.valueOf(msgParts[2]);
				
					switch(command) {
						case "SCRIPTS":	{
							if("*".equals(action)) {
								activator.reloadScript(ALL_SCRIPTS);
								System.out.println("[IntelligentHome:PlannerCmdBroker] All scripts reloaded!");
							}
							else {
								try {
									int id = Integer.parseInt(action);
									activator.reloadScript(id);
									System.out.println("[IntelligentHome:PlannerCmdBroker] Scripts ID "+id+" reloaded!");
								}
								catch(NumberFormatException nfe) {
									System.out.println("[IntelligentHome:PlannerCmdBroker] Script ID maformed ["+action+"].");
								}
							}
							break;
						}
						default: {
							System.out.println("[IntelligentHome:PlannerCmdBroker] Unkwnonw command ["+command+"].");
						}
					}
				}
			}
			else {
				System.out.println("[IntelligentHome:PlannerCmdBroker] Message malformed! ["+sMessage+"].");
			}
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:PlannerCmdBroker] Message is unreadable! "+e);
		}
	}
}
