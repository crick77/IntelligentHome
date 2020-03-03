package it.univaq.se4as.project.ih.api;

public class OnOffActuatorFactory extends GenericFactory<Actuator<Boolean>> {
	@Override
	public Actuator<Boolean> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Actuator<Boolean>(name, measureUnit, destinationUrl, Boolean.class);
	}
}
