package it.univaq.se4as.project.ih.api.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import it.univaq.se4as.project.ih.api.Probe;

public class History extends BaseService {
	public final static String REFERENCE = History.class.getName();
	
	public History() throws ClassNotFoundException {
		super();
	}

	public boolean saveSensorData(String sensorName, Object value) {
		try(Connection con = getConnection()) {
			String sql = "INSERT INTO sensordata (observation, sensorname, value) VALUES (?, ?, ?)";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
				ps.setString(2, sensorName);
				ps.setString(3, String.valueOf(value));
				
				ps.executeUpdate();
			}
			
			System.out.println("[IntelligentHome:History] value "+value+" for "+sensorName+" saved.");
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}
	
	public boolean saveActuatorData(String actuatorName, Object value) {
		try(Connection con = getConnection()) {
			String sql = "INSERT INTO actuatordata (observation, actuatorname, value) VALUES (?, ?, ?)";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
				ps.setString(2, actuatorName);
				ps.setString(3, String.valueOf(value));
				
				ps.executeUpdate();
			}
			
			System.out.println("[IntelligentHome:History] value "+value+" for "+actuatorName+" saved.");
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}
	
	public Map<String, Probe> getLastSensorValues() {
		Map<String, Probe> sensorValues = new HashMap<>();
		
		try(Connection con = getConnection()) {
			List<String> sensors = new ArrayList<>();
			
			String sql = "SELECT devicename FROM sensors s WHERE s.enabled = true";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				try(ResultSet rs = ps.executeQuery()) {
					while(rs.next()) {
						String deviceName = rs.getString("devicename");
						sensors.add(deviceName);
					}
				}
			}
			
			sql = "select sd.value, sd.observation FROM intelligenthome.sensordata sd WHERE sd.sensorname = ? AND " + 
			      "sd.observation = (SELECT MAX(sd2.observation) FROM sensordata AS sd2 WHERE sd2.sensorname = ?)";	
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				for(String sensorName : sensors) {
					ps.clearParameters();
					ps.setString(1, sensorName);
					ps.setString(2, sensorName);
					
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
							String value = rs.getString("value");
							Timestamp time = rs.getTimestamp("observation");
							
							sensorValues.put(sensorName, new Probe(value, time.getTime()));
						}
					}
				}
					
				return sensorValues;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	public Map<String, Long> getLastSensorProbe() {
		Map<String, Long> sensorTime = new HashMap<>();
		
		try(Connection con = getConnection()) {
			List<String> sensors = new ArrayList<>();
			
			String sql = "SELECT devicename FROM sensors s WHERE s.enabled = true";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				try(ResultSet rs = ps.executeQuery()) {
					while(rs.next()) {
						String deviceName = rs.getString("devicename");
						sensors.add(deviceName);
					}
				}
			}
			
			sql = "select sd.observation as obstime FROM intelligenthome.sensordata sd WHERE sd.sensorname = ? AND " + 
			      "sd.observation = (SELECT MAX(sd2.observation) FROM sensordata AS sd2 WHERE sd2.sensorname = ?)";	
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				for(String sensorName : sensors) {
					ps.clearParameters();
					ps.setString(1, sensorName);
					ps.setString(2, sensorName);
					
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
							Timestamp value = rs.getTimestamp("obstime");
							
							sensorTime.put(sensorName, value.getTime());
						}
					}
				}
					
				return sensorTime;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/
}
