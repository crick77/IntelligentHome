package it.univaq.se4as.project.ih.api;

public class Probe {
	private String value;
	private long time;
	
	public Probe(String value, long time) {
		super();
		this.value = value;
		this.time = time;
	}
	
	public String getValue() {
		return value;
	}
	
	public long getTime() {
		return time;
	}

	@Override
	public String toString() {
		return "Probe [value=" + value + ", time=" + time + "]";
	};
}
