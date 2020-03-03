package it.univaq.se4as.project.ih.api;

public class ContinuousSensorFactory extends GenericFactory<Sensor<Double>> {
	@Override
	public Sensor<Double> newInstance(String name, String measureUnit, String destinationUrl) {
		return new Sensor<Double>(name, measureUnit, Double.class);
	}
}
