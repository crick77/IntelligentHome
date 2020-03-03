package it.univaq.se4as.project.ih.analyzer;

import java.util.Map;

import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.ServiceReference;

import it.univaq.se4as.project.ih.analyzer.mqtt.AnalyzerBrokerCallback;
import it.univaq.se4as.project.ih.api.BaseActivator;
import it.univaq.se4as.project.ih.api.Sensor;

public class AnalyzerActivator extends BaseActivator {
	private AnalyzerChecker ac;
	
	public void localStart() throws Exception {
		System.out.println("[IntelligenHome:AnalyzerActivator] Started!");
		
		Map<String, Sensor<?>> sensors = getConfiguration().getSensors(true);
		if(sensors==null) throw new Exception("[IntelligenHome:AnalyzerActivator] Sensors not loaded. Quitting!");
		
		System.out.println("[IntelligenHome:ExecutorActivator] Registering broker...");
		reconnect(sensors);
		
		//ac = new AnalyzerChecker(this);
		//ac.start();
	}

	public void localStop() throws Exception {
		if(ac!=null) ac.terminate();
	}

	public void reconnect(Map<String, Sensor<?>> sensors) throws Exception {
		AnalyzerBrokerCallback bcb = new AnalyzerBrokerCallback(sensors, this);
		getContext().registerService(bcb.getClass().getName(), bcb, null);
		System.out.println("[IntelligenHome:AnalyzerActivator] Broker registration DONE!");
	}
	
	public AnalyzerBrokerCallback getCallback() throws InvalidSyntaxException {
		ServiceReference<?>[] refs = getContext().getAllServiceReferences(AnalyzerBrokerCallback.class.getName(), null);
		if(refs.length==1) {
			return (AnalyzerBrokerCallback)getContext().getService(refs[0]);
		}
		return null;
	}
}
