package it.univaq.seas.model;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Rule {
	private int id;
	private String name;
	private List<String> sensors;
	private List<String> actuators;
	private String codetext;
	private boolean enabled;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getActuators() {
		return actuators;
	}
	public void setActuators(List<String> actuators) {
		this.actuators = actuators;
	}
	public List<String> getSensors() {
		return sensors;
	}
	public void setSensors(List<String> sensors) {
		this.sensors = sensors;
	}
	public String getCodetext() {
		return codetext;
	}
	public void setCodetext(String codetext) {
		this.codetext = codetext;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
