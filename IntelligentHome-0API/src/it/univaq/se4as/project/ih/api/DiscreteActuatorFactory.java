package it.univaq.se4as.project.ih.api;

public class DiscreteActuatorFactory extends GenericFactory<Actuator<Integer>> {
	@Override
	public Actuator<Integer> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Actuator<Integer>(name, measureUnit, destinationUrl, Integer.class);
	}
}
