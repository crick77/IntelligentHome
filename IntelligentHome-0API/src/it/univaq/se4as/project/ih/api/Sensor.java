package it.univaq.se4as.project.ih.api;

import java.io.Serializable;


public class Sensor<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String measureUnit;
	private T value;
	private Class<?> clazz;
	
	protected Sensor(String name, String measureUnit, Class<?> clazz) {
		this.name = name;
		this.measureUnit = measureUnit;
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
		if(value==null) {
			setValue(null);
			return true;
		}
		
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
						if(value.contains(",")) value = value.replace(",", ".");
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
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Sensor<?> other = (Sensor<?>) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (value == null) {
			if (other.value != null)
				return false;
		} else if (!value.equals(other.value))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Sensor [name=" + name + ", value=" + value + (measureUnit!=null ? measureUnit : "") + "]";
	}
}
