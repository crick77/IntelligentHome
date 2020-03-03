package it.univaq.seas.mqtt.comunication;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttSecurityException;

public class MqttComunicator {
	private final static String MQTT_HOST = "tcp://localhost:1883";
	public final static String UPDATER_TOPIC = "sysupdates";

	private MqttComunicator() {
	}
	
	public static void SendMessageMQTT(String topic, String message) throws MqttSecurityException, MqttException {
		MqttClient client = null;
		try {
			client = new MqttClient(MQTT_HOST, MqttComunicator.class.getName());
			client.connect();
			MqttMessage mqttmessage = new MqttMessage(message.getBytes());
			client.publish(topic, mqttmessage);
		} finally {
			client.disconnect();
			client.close();
		}
	}
}
