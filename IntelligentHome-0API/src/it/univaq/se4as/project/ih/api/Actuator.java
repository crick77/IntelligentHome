package it.univaq.se4as.project.ih.api;

import java.io.Serializable;

public final class Actuator<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String measureUnit;
	private String destinationUrl;
	private T value;
	private Class<?> clazz;
	
	protected Actuator(String name, String measureUnit, String destinationUrl, Class<?> clazz) {
		this.name = name;
		this.measureUnit = measureUnit;
		this.destinationUrl = destinationUrl;
		this.clazz = clazz;
	}
	
	public T getValue() {
		return value;
	}

	public boolean setValue(T value) {
		if(this.value==null || !this.value.equals(value)) {
			this.value = value;
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public boolean setValueAsString(String value) {
		try {
			Object o = null;
			if(clazz.isAssignableFrom(Integer.class)) {
				o = Integer.parseInt(value);
			}
			else
				if(clazz.isAssignableFrom(Boolean.class)) {
					o = Boolean.parseBoolean(value);
				}
				else
					if(clazz.isAssignableFrom(Double.class)) {
						o = Double.parseDouble(value);
					}
					else
						if(clazz.isAssignableFrom(String.class)) {
							o = value;
							
						}
			
			return setValue((T)o);
		}
		catch(Exception e) {
			throw new IllegalArgumentException("Non so come convertire ["+value+"] a "+value.getClass());
		}
	}
	
	public String getName() {
		return name;
	}

	public String getMeasureUnit() {
		return measureUnit;
	}
	
	public String getDestinationUrl() {
		return destinationUrl;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	
	@Override
	@SuppressWarnings("unchecked")
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		try {
			Actuator<T> other = (Actuator<T>)obj;
			if (name == null) {
				if (other.name != null)
					return false;
			} else if (!name.equals(other.name))
				return false;
			return true;
		}
		catch(ClassCastException cce) {
			return false;
		}
	}

	@Override
	public String toString() {
		return "Actuator [name=" + name + ", value=" + value + (measureUnit!=null ? measureUnit : "") + ", url="+destinationUrl+"]";
	}
}
