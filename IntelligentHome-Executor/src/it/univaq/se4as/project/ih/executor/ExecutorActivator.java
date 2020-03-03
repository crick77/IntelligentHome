package it.univaq.se4as.project.ih.executor;

import java.util.Map;

import it.univaq.se4as.project.ih.api.Actuator;
import it.univaq.se4as.project.ih.api.BaseActivator;
import it.univaq.se4as.project.ih.executor.mqtt.ExecutorBrokerCallback;

public class ExecutorActivator extends BaseActivator {
	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#start(org.osgi.framework.BundleContext)
	 */
	public void localStart() throws Exception {
		System.out.println("[IntelligenHome:ExecutorActivator] starting...");
		
		Map<String, Actuator<?>> actuators = getConfiguration().getActuators(true);
		if(actuators==null) throw new Exception("[IntelligenHome:ExecutorActivator] Actuators not loaded. Quitting!");
		
		System.out.println("[IntelligenHome:ExecutorActivator] Registering broker...");
		reconnect(actuators);
	}

	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#stop(org.osgi.framework.BundleContext)
	 */
	public void localStop() throws Exception {
	}

	public void reconnect(Map<String, Actuator<?>> actuators) throws Exception {
		ExecutorBrokerCallback bcb = new ExecutorBrokerCallback(actuators, this);
		getContext().registerService(bcb.getClass().getName(), bcb, null);
		System.out.println("[IntelligenHome:ExecutorActivator] Broker registration DONE!");
	}
}
