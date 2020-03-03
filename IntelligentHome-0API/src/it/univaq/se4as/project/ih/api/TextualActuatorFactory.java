package it.univaq.se4as.project.ih.api;

public class TextualActuatorFactory extends GenericFactory<Actuator<String>> {
	@Override
	public Actuator<String> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Actuator<String>(name, measureUnit, destinationUrl, String.class);
	}
}
