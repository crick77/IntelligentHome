package it.univaq.se4as.project.ih.planner;

import java.util.Map;

import org.osgi.framework.InvalidSyntaxException;

import it.univaq.se4as.project.ih.api.Actuator;
import it.univaq.se4as.project.ih.api.BaseActivator;
import it.univaq.se4as.project.ih.api.Script;
import it.univaq.se4as.project.ih.api.Sensor;
import it.univaq.se4as.project.ih.planner.mqtt.PlannerBrokerCallback;
import it.univaq.se4as.project.ih.planner.mqtt.PlannerCommandBrokerCallback;

public class PlannerActivator extends BaseActivator {
	public Map<String, Sensor<?>> sensors;
	public Map<String, Actuator<?>> actuators;
	public Map<String, Script> scripts;
	private PlannerIA ia;
	private PlannerBrokerCallback bcb;
	
	public void localStart() throws Exception {
		System.out.println("[IntelligenHome:PlannerActivator] Started!");
		
		sensors = getConfiguration().getSensors(false);
		actuators = getConfiguration().getActuators(false);
		scripts = getScripts().getScripts(true);
		
		System.out.println("[IntelligenHome:ExecutorActivator] Registering broker...");
		reconnect();
		reconnectUpdater();
		
		ia = new PlannerIA(this);
		ia.start();
	}

	@Override
	public void localStop() throws Exception {
		if(ia!=null) {
			ia.halt();
		}
		if(bcb!=null && bcb.pool!=null) {
			bcb.pool.shutdown();
		}
	}
	
	public void reconnect() throws Exception {
		bcb = new PlannerBrokerCallback(this);
		getContext().registerService(bcb.getClass().getName(), bcb, null);
		System.out.println("[IntelligenHome:PlannerActivator] Broker registration DONE!");
	}
	
	public void reconnectUpdater() throws Exception {
		PlannerCommandBrokerCallback bcb = new PlannerCommandBrokerCallback(this);
		getContext().registerService(bcb.getClass().getName(), bcb, null);
		System.out.println("[IntelligenHome:PlannerActivator] Broker registration DONE!");
	}
	
	public void reloadScript(Integer id) {
		if(id==null) {
			try {
				scripts = getScripts().getScripts(true);
			} catch (InvalidSyntaxException e) {				
				e.printStackTrace();
			}
		}
		else {
			Script s;
			try {
				s = getScripts().getScript(id);
				scripts.put(s.getName(), s);
			} catch (InvalidSyntaxException e) {
				e.printStackTrace();
			}
		}
	}
}
