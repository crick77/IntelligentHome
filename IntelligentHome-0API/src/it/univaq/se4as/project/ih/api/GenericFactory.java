package it.univaq.se4as.project.ih.api;

import java.util.HashMap;
import java.util.Map;

public abstract class GenericFactory<T> {
	private static Map<Class<?>, GenericFactory<?>> actuatorBuilders = new HashMap<>();
	private static Map<Class<?>, GenericFactory<?>> sensorBuilders = new HashMap<>();

	@SuppressWarnings("unchecked")
	public static <T> Actuator<T> newActuatorInstance(String name, String measureUnit, String destinationUrl, Class<T> clazz) {
		if (!actuatorBuilders.containsKey(clazz)) {
		      throw new IllegalArgumentException("Missing Element Factory for Type " + clazz);
		}
		
		return (Actuator<T>)(actuatorBuilders.get(clazz).newInstance(name, measureUnit, destinationUrl));
	}

	@SuppressWarnings("unchecked")
	public static <T> Sensor<T> newSensorInstance(String name, String measureUnit, Class<T> clazz) {
		if (!sensorBuilders.containsKey(clazz)) {
		      throw new IllegalArgumentException("Missing Element Factory for Type " + clazz);
		}
		
		return (Sensor<T>)(sensorBuilders.get(clazz).newInstance(name, measureUnit, null));
	}
	
	public abstract T newInstance(String name, String measureUnit, String destinationUrl);

	static {
		actuatorBuilders.put(Integer.class, new DiscreteActuatorFactory());
		actuatorBuilders.put(String.class, new TextualActuatorFactory());
		actuatorBuilders.put(Double.class, new ContinuousActuatorFactory());
		actuatorBuilders.put(Boolean.class, new OnOffActuatorFactory());
		
		sensorBuilders.put(Integer.class, new DiscreteSensorFactory());
		sensorBuilders.put(String.class, new TextualSensorFactory());
		sensorBuilders.put(Double.class, new ContinuousSensorFactory());
		sensorBuilders.put(Boolean.class, new OnOffSensorFactory());
	}
}
