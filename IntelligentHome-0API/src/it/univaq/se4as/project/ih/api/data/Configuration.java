package it.univaq.se4as.project.ih.api.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import it.univaq.se4as.project.ih.api.Actuator;
import it.univaq.se4as.project.ih.api.DataTypes;
import it.univaq.se4as.project.ih.api.GenericFactory;
import it.univaq.se4as.project.ih.api.Sensor;

public class Configuration extends BaseService {
	public final static String REFERENCE = Configuration.class.getName();
	private Map<String, Sensor<?>> sensors;
	private Map<String, Actuator<?>> actuators;

	public Configuration() throws ClassNotFoundException {
		super();
	}

	public synchronized Map<String, Sensor<?>> getSensors(boolean reload) {
		if(!reload && sensors!=null) {
			return sensors;
		}
		
		sensors = new HashMap<>();
		
		try(Connection con = getConnection()) {
			String sql = "SELECT * from sensors s WHERE s.enabled = true";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				try(ResultSet rs = ps.executeQuery()) {
					while(rs.next()) {
						String sensorName = rs.getString("devicename");
						String measureUnit = rs.getString("measureunit");
						String inputType = rs.getString("inputtype");
						
						sensors.put(sensorName, 
									GenericFactory.newSensorInstance(sensorName, measureUnit, DataTypes.getType(inputType)));
					}
				}
			}
			
			System.out.println("[IntelligentHome:Configuration] "+sensors.size()+" Sensors Loaded");
			return sensors;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public synchronized Map<String, Actuator<?>> getActuators(boolean reload) {
		if(!reload && actuators!=null) {
			return actuators;
		}
		
		actuators = new HashMap<>();
		
		try(Connection con = getConnection()) {		
			String sql = "SELECT * from actuators a WHERE a.enabled = true";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				try(ResultSet rs = ps.executeQuery()) {
					while(rs.next()) {
						String actuatoreName = rs.getString("devicename");
						String measureUnit = rs.getString("measureunit");
						String outputType = rs.getString("outputtype");
						String url = rs.getString("url");
						
						actuators.put(actuatoreName, 
								      GenericFactory.newActuatorInstance(actuatoreName, measureUnit, url, DataTypes.getType(outputType)));
					}
				}
			}
			System.out.println("[IntelligenHome:Configuration] "+actuators.size()+" Actuators Loaded");
			return actuators;
		}
		catch(Exception e) {
			return null;
		}
	}
}
