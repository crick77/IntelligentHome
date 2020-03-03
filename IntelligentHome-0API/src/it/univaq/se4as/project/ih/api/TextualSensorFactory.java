package it.univaq.se4as.project.ih.api;

public class TextualSensorFactory extends GenericFactory<Sensor<String>> {
	@Override
	public Sensor<String> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Sensor<String>(name, measureUnit, String.class);
	}
}
