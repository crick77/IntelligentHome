package it.univaq.se4as.project.ih.analyzer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import it.univaq.se4as.project.ih.analyzer.mqtt.AnalyzerBrokerCallback;
import it.univaq.se4as.project.ih.api.Probe;

public class AnalyzerChecker extends Thread {
	private boolean stopped = false;
	private AnalyzerActivator activator;
	private AnalyzerBrokerCallback cb;
	
	public AnalyzerChecker(AnalyzerActivator activator) throws Exception {
		super();
		this.activator = activator;
		this.cb = activator.getCallback();
	}
	
	@Override
	public void run() {
		System.out.print("[IntelligentHome:AnalyzerChecker] started!");
		while(!stopped) {
			try {
				Map<String, Probe> sensorProbes = activator.getHistory().getLastSensorValues();
				System.out.println("[IntelligentHome:AnalyzerChecker] Last sensor probe retrieved: "+sensorProbes.size());
				long now = System.currentTimeMillis();
				List<String> brokeSensors = new ArrayList<>();
				for(String sensName : sensorProbes.keySet()) {
					long sensTime = sensorProbes.get(sensName).getTime();
					if((now-sensTime)>5000) {
						brokeSensors.add(sensName);
					}
				}
			
				if(brokeSensors.size()>0) {
					String list = String.join(",", brokeSensors.toArray(new String[]{}));
					System.out.println("[IntelligentHome:AnalyzerChecker] Sensors not probed in 5 seconds: "+list);
					cb.publishMessage(new MqttMessage(("NOTIFY:PROBE:"+list).getBytes()));
				}
				
				try {
					Thread.sleep(10*1000);
				}
				catch(InterruptedException ie) {}
			}
			catch(Exception e) {
				String msg = "NOTIFY:PROBE:Errore Probe!";
				try {
					cb.publishMessage(new MqttMessage(msg.getBytes()));
				}
				catch(MqttException mqtte) {
					System.err.println("[IntelligentHome:AnalyzerChecker] Impossibile inviare messaggio: "+mqtte);
				}
			}
		}
		System.out.print("[IntelligentHome:AnalyzerChecker] STOPPED!");
	}

	public void terminate() {
		System.out.print("[IntelligentHome:AnalyzerChecker] STOP request!");
		stopped = true;
	}
}
