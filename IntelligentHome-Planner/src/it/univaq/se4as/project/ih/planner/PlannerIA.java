package it.univaq.se4as.project.ih.planner;

import java.util.Map;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONObject;

import it.univaq.se4as.project.ih.api.Probe;
import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;

public class PlannerIA extends Thread {
	private final static long TIME_THRESHOLD = 15;
	private PlannerActivator activator;
	private boolean running;
	private MqttClient client;

	public PlannerIA(PlannerActivator activator) throws Exception {
		super();
		this.activator = activator;
		this.running = false;
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.connect();
		
		System.out.println("[IntelligentHome:PlannerIA] IA Thread started!");
	}

	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		running = true;
		while(isRunning()) {
			// run the neural net
			try {
				long now = System.currentTimeMillis();
				
				Map<String , Probe> values = activator.getHistory().getLastSensorValues();
			
				Probe p = values.get("PosizioneBob");
				if(p!=null) {
					if((now-p.getTime())<=(TIME_THRESHOLD*1000)) {
						String bobPos = p.getValue();
						System.out.println("[IntelligentHome:PlannerIA] Last bob pos = "+bobPos);
					
						double dist = Double.parseDouble(bobPos);
						
						Probe porta = values.get("PortaCasa");
						boolean portaAperta = (porta!=null) ? Boolean.parseBoolean(porta.getValue()) : true; 
						
						if(dist>=100 && portaAperta) {
							System.out.println("[IntelligentHome:PlannerIA] Distance over 100m!");
								
							MqttMessage outMsg = new MqttMessage(("PortaCasa:false").getBytes());
							client.publish(MQTTParams.EXECUTOR_TOPIC, outMsg);
							
							JSONObject obj = new JSONObject();
							obj.put("name", "PortaCasa!");
							obj.put("value", "false");
							outMsg = new MqttMessage(obj.toJSONString().getBytes());
							client.publish(MQTTParams.ANALYER_TOPIC, outMsg);
							outMsg = new MqttMessage(("LCD:Chiudo porta...ciao Bob!").getBytes());
							client.publish(MQTTParams.EXECUTOR_TOPIC, outMsg);
							
							System.out.println("[IntelligentHome:PlannerIA] Actuators done!");
						}
						else {
							System.out.println("[IntelligentHome:PlannerIA] Near home or door closed...nothing to do!");
						}
					}
					else {
						System.out.println("[IntelligentHome:PlannerIA] Data is older than "+TIME_THRESHOLD+"s to be processed, skipping.");
					}
				}

				Thread.sleep(20000);
			}
			catch(Exception ie) {}
		}
		
		if(client!=null) {
			try {
				client.disconnect();
			}
			catch(Exception e) {}
		}
		
		System.out.println("[IntelligentHome:PlannerIA] STOPPED!");
	}

	private synchronized boolean isRunning() {
		return running;
	}
	
	public synchronized void halt() {
		running = false;
		System.out.println("[IntelligentHome:PlannerIA] Stopping...");
	}
}
