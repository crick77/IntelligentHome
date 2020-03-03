package it.univaq.se4as.project.ih.api.mqtt;

public class MQTTParams {
	public final static String MQTT_HOST = "tcp://localhost:1883";
	public final static String MQTT_BASE = "IntelligentHome";
	public final static String ANALYER_TOPIC = "analyzer";
	public final static String EXECUTOR_TOPIC = "executor";
	public final static String PLANNER_TOPIC = "planner";
	public final static String UPDATER_TOPIC = "sysupdates";
	
	private MQTTParams() {
	}
}
