package it.univaq.se4as.project.ih.api;

public class OnOffSensorFactory extends GenericFactory<Sensor<Boolean>> {
	@Override
	public Sensor<Boolean> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Sensor<Boolean>(name, measureUnit, Boolean.class);
	}
}
