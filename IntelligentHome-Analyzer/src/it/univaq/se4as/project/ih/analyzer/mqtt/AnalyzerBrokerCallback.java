package it.univaq.se4as.project.ih.analyzer.mqtt;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import it.univaq.se4as.project.ih.analyzer.AnalyzerActivator;
import it.univaq.se4as.project.ih.api.Sensor;
import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;

public class AnalyzerBrokerCallback implements MqttCallback {
	private AnalyzerActivator activator; 
	private MqttClient client;
	private Map<String, Sensor<?>> sensors;
	private Map<String, Integer> errors;
	private JSONParser parser = new JSONParser();
	
	public AnalyzerBrokerCallback(Map<String, Sensor<?>> sensors, AnalyzerActivator activator) throws Exception {
		this.sensors = sensors;
		this.activator = activator;
		this.errors = new HashMap<>();
		for(String sName : sensors.keySet()) {
			errors.put(sName, 0);
		}
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.setCallback(this);
		client.connect();
		client.subscribe(MQTTParams.ANALYER_TOPIC);
		System.out.printf("[IntelligentHome:AnalyzerBroker] Listening data from topic [%s] on host [%s]/[%s]\n", MQTTParams.ANALYER_TOPIC, MQTTParams.MQTT_HOST, getClass().getName());
	}
	
	@Override
	public void connectionLost(Throwable ex) {
		System.err.println("[IntelligentHome:AnalyzerBroker] The connection with the server is lost. !!!! "+ex);
		try {
			activator.reconnect(sensors);
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:ExecutorBroker] Reconnection failed");
		}
	}

	@Override
	public void deliveryComplete(IMqttDeliveryToken token) {
		System.out.println("[IntelligentHome:AnalyzerBroker] The delivery of message has been complete.");
	}

	@Override
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		String sMessage = message.toString();
		String sensorName = "UNKWNOWN";
		System.out.println("[IntelligentHome:AnalyzerBroker] A new message arrived from the topic: \"" + topic + "\". The payload of the message is " + sMessage);	
		try {
			JSONObject obj = (JSONObject)parser.parse(sMessage);
			
			sensorName = String.valueOf(obj.get("name"));
			String newValue = String.valueOf(obj.get("value"));
			
			boolean onlyUpdate = false;
			if(sensorName.endsWith("!")) {
				onlyUpdate = true;
				sensorName = sensorName.replace("!", "").trim();
			}
			
			Sensor<?> sensor = sensors.get(sensorName);
			if(sensor!=null) {
				System.out.println("[IntelligentHome:AnalyzerBroker] Found device "+sensor);
				if(sensor.setValueAsString(newValue) && !onlyUpdate) {
					MqttMessage outMsg = new MqttMessage(("DATA:"+sensorName+":"+newValue).getBytes());
					publishMessage(outMsg);
					
					System.out.println("[IntelligentHome:AnalyzerBroker] "+sensor+" updateed");
				}
				else {
					System.out.println("[IntelligentHome:AnalyzerBroker] "+sensor+" not changed.");
				}
				activator.getHistory().saveSensorData(sensorName, newValue);
				errors.put(sensorName, 0);
			}
			else {
				System.out.println("[IntelligentHome:AnalyzerBroker] Device "+sensorName+" not found value="+newValue);
				MqttMessage outMsg = new MqttMessage(("NOTIFY:"+sensorName+":Not found").getBytes());
				publishMessage(outMsg);
			}
		}
		catch(IllegalArgumentException iae) {
			int errorCount = errors.get(sensorName);
			errors.put(sensorName, (errorCount+1));
			System.err.println("[IntelligentHome:AnalyzerBroker] New value cannot be assigned!");
			MqttMessage outMsg;
			if(errorCount>=3) {
				outMsg = new MqttMessage(("NOTIFY:"+sensorName+":May be broken!").getBytes());
			}
			else {
				outMsg = new MqttMessage(("NOTIFY:"+sensorName+":Invalid data ["+errors.get(sensorName)+"]").getBytes());
			}
			publishMessage(outMsg);
		}
		catch(Exception e) {
			System.err.println("[IntelligentHome:AnalyzerBroker] Message is unreadable! "+e);
			MqttMessage outMsg = new MqttMessage(("ERROR::Message unreadable").getBytes());
			publishMessage(outMsg);
		}
	}
	
	public void publishMessage(MqttMessage msg)throws MqttException {
		client.publish(MQTTParams.PLANNER_TOPIC, msg);
	}
}
