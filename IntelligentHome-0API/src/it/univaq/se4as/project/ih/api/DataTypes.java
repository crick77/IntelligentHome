package it.univaq.se4as.project.ih.api;

import java.util.HashMap;
import java.util.Map;

public final class DataTypes {
	public final static Map<String, Class<?>> DATA_TYPES = new HashMap<>();
	
	private DataTypes() {
	}
	
	public static Class<?> getType(String typeName) {
		if(DATA_TYPES.size()==0) {
			DATA_TYPES.put("CONTINUOUS", java.lang.Double.class);
	    	DATA_TYPES.put("DISCREETE", java.lang.Integer.class);
	    	DATA_TYPES.put("ON/OFF", java.lang.Boolean.class);
	    	DATA_TYPES.put("TEXTUAL", java.lang.String.class);
		}
		
		return DATA_TYPES.get(typeName);
	}
}
