package it.univaq.se4as.project.ih.api;

import java.io.Serializable;
import java.util.List;

public class Script implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private List<String> sensors;
	private List<String> actuators;
	private String script;
	
	public Script(String name, List<String> sensors, List<String> actuators, String script) {
		super();
		this.name = name;
		this.sensors = sensors;
		this.actuators = actuators;
		this.script = script;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public List<String> getSensors() {
		return sensors;
	}
	
	public void setSensors(List<String> sensors) {
		this.sensors = sensors;
	}
	
	public List<String> getActuators() {
		return actuators;
	}
	
	public void setActuators(List<String> actuators) {
		this.actuators = actuators;
	}
	
	public String getScript() {
		return script;
	}
	
	public void setScript(String script) {
		this.script = script;
	}

	@Override
	public String toString() {
		return "Script [name=" + name + ", sensors=" + sensors + ", actuators=" + actuators + ", script=" + script
				+ "]";
	}
}
