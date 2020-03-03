package it.univaq.se4as.project.ih.api.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import it.univaq.se4as.project.ih.api.Script;

public class Scripts extends BaseService {
	public final static String REFERENCE = Scripts.class.getName();
	private Map<String, Script> scripts;

	public Scripts() throws ClassNotFoundException {
		super();
	}

	public synchronized Map<String, Script> getScripts(boolean reload) {
		if(!reload && scripts!=null) {
			return scripts;
			
		}
		scripts = new HashMap<>();
		
		try(Connection con = getConnection()) {
			String sql = "SELECT * from scripts s WHERE s.enabled = true";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				try(ResultSet rs = ps.executeQuery()) {
					while(rs.next()) {
						String scriptName = rs.getString("name");
						String scriptSensors = rs.getString("sensorlist");
						String scriptActuators = rs.getString("actuatorlist");
						String code = rs.getString("script");
						
						String[] ss = scriptSensors.split(",");
						for(int i=0;i<ss.length;i++) ss[i]=ss[i].trim();
						
						String[] sa = scriptActuators.split(",");
						for(int i=0;i<sa.length;i++) sa[i]=sa[i].trim();
						
						List<String> ssList = Arrays.asList(ss);
						List<String> saList = Arrays.asList(sa);
						
						Script script = new Script(scriptName, ssList, saList, code);
						scripts.put(scriptName, script);
					}
				}
			}
			
			System.out.println("[IntelligentHome:Scripts] "+scripts.size()+" scripts Loaded");
			return scripts;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public Script getScript(int id) {
		Script script = null;
		
		try(Connection con = getConnection()) {
			String sql = "SELECT * from scripts s WHERE s.enabled = true and id = ?";
			try(PreparedStatement ps = con.prepareStatement(sql)) {
				ps.setInt(1, id);
				
				try(ResultSet rs = ps.executeQuery()) {
					if(rs.next()) {
						String scriptName = rs.getString("name");
						String scriptSensors = rs.getString("sensorlist");
						String scriptActuators = rs.getString("actuatorlist");
						String code = rs.getString("script");
						
						String[] ss = scriptSensors.split(",");
						for(int i=0;i<ss.length;i++) ss[i]=ss[i].trim();
						
						String[] sa = scriptActuators.split(",");
						for(int i=0;i<sa.length;i++) sa[i]=sa[i].trim();
						
						List<String> ssList = Arrays.asList(ss);
						List<String> saList = Arrays.asList(sa);
						
						script = new Script(scriptName, ssList, saList, code);						
					}
				}
			}
			
			System.out.println("[IntelligentHome:Scripts] Scripts id="+id+" Loaded");
			return script;
		}
		catch(Exception e) {
			return null;
		}
	}
}
