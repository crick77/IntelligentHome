package it.univaq.se4as.project.ih.api;

public class DiscreteSensorFactory extends GenericFactory<Sensor<Integer>> {
	@Override
	public Sensor<Integer> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Sensor<Integer>(name, measureUnit, Integer.class);
	}
}
