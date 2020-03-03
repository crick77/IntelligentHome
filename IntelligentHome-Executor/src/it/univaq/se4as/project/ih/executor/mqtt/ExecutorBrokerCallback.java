package it.univaq.se4as.project.ih.executor.mqtt;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import it.univaq.se4as.project.ih.api.Actuator;
import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;
import it.univaq.se4as.project.ih.executor.ExecutorActivator;

public class ExecutorBrokerCallback implements MqttCallback {
	private ExecutorActivator activator; 
	private MqttClient client;
	private Map<String, Actuator<?>> actuators;
	
	public ExecutorBrokerCallback(Map<String, Actuator<?>> actuators, ExecutorActivator activator) throws Exception {
		this.activator = activator;
		this.actuators = actuators;
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.setCallback(this);
		client.connect();
		client.subscribe(MQTTParams.EXECUTOR_TOPIC);
		System.out.printf("[IntelligentHome:ExecutorBroker] Listening data from topic [%s] on host [%s]/[%s]\n", MQTTParams.EXECUTOR_TOPIC, MQTTParams.MQTT_HOST, getClass().getName());
	}
	
	@Override
	public void connectionLost(Throwable ex) {
		System.err.println("[IntelligentHome:ExecutorBroker] The connection with the server is lost. !!!! "+ex);
		try {
			activator.reconnect(actuators);
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:ExecutorBroker] Reconnection failed");
		}
	}

	@Override
	public void deliveryComplete(IMqttDeliveryToken token) {
		System.out.println("[IntelligentHome:ExecutorBroker] The delivery has been complete. The delivery token is: " + token);
	}

	@Override
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		String sMessage = message.toString();
		System.out.println("[IntelligentHome:ExecutorBroker] A new message arrived from the topic: \"" + topic + "\". The payload of the message is " + sMessage);	
		try {
			String[] data = sMessage.split(":");
			String actuatorName = data[0];
			String actuatorValue = data[1];
			
			Actuator<?> act = actuators.get(actuatorName);
			
			System.out.print("[IntelligentHome:ExecutorBroker] Sending '"+sMessage+"' to "+act.getDestinationUrl()+"...");
			URL url = new URL(act.getDestinationUrl());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setDoOutput(true);
			conn.setInstanceFollowRedirects(false);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "text/plain"); 
			conn.setRequestProperty("charset", "utf-8");
			conn.setRequestProperty("Content-Length", ""+sMessage.length());
			conn.setUseCaches(false);
			try(DataOutputStream wr = new DataOutputStream(conn.getOutputStream())) {
			   wr.write(sMessage.getBytes());
			   wr.flush();
			}
			System.out.println("DONE!");
			conn.connect();
			System.out.println("[IntelligentHome:ExecutorBroker] Response code = "+conn.getResponseCode());
			conn.disconnect();
			
			activator.getHistory().saveActuatorData(act.getName(), actuatorValue);
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:ExecutorBroker] Message is unreadable! "+e);
			e.printStackTrace();
		}
	}
}
