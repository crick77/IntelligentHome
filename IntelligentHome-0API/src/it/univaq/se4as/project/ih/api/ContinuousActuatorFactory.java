package it.univaq.se4as.project.ih.api;

public class ContinuousActuatorFactory extends GenericFactory<Actuator<Double>> {
	@Override
	public Actuator<Double> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Actuator<Double>(name, measureUnit, destinationUrl, Double.class);
	}
}
