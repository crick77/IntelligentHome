package it.univaq.seas.rules;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import it.univaq.seas.model.Rule;
import it.univaq.seas.mqtt.comunication.MqttComunicator;


public class SaveRuleImpl implements SaveRule{
	final private static Response BAD_REQUEST = Response.status(Response.Status.BAD_REQUEST).header("Access-Control-Allow-Origin", "*")
			.header("Access-Control-Allow-Credentials", "true")
			.header("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization")
			.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD")
			.build();
	
	final private static Response INTERNAL_SERVER_ERROR  = Response.status(Response.Status.INTERNAL_SERVER_ERROR).header("Access-Control-Allow-Origin", "*")
			.header("Access-Control-Allow-Credentials", "true")
			.header("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization")
			.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD")
			.build();
	
	final private static Response OK = Response.ok().header("Access-Control-Allow-Origin", "*")
			.header("Access-Control-Allow-Credentials", "true")
			.header("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization")
			.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD")
			.build();
	
	@Override
	public Response saveRule(String rule) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			Rule newRule = mapper.readValue(rule,Rule.class);
			try(Connection con = ConnectDB()) {
				String sql = "INSERT INTO intelligenthome.scripts (name,sensorlist,actuatorlist,script,enabled) values (?,?,?,?,?)";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					ps.setString(1, newRule.getName());
					ps.setString(2, String.join(",",newRule.getSensors()));
					ps.setString(3, String.join(",",newRule.getActuators()));
					ps.setString(4, newRule.getCodetext());
					ps.setBoolean(5, newRule.isEnabled());
					ps.executeUpdate();
					MqttComunicator.SendMessageMQTT(MqttComunicator.UPDATER_TOPIC, "PLANNER:SCRIPTS:*");
				}
			}			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
		return OK;
	}

	private Connection ConnectDB() throws ClassNotFoundException, SQLException {
		Class.forName("org.postgresql.Driver");
		return DriverManager.getConnection("jdbc:postgresql:postgres?currentSchema=intelligenthome", "postgres", "Siemens123");
	}

	@Override
	public Response getSensors() {
		try {
			List<String> s = new ArrayList<>();
			try(Connection con = ConnectDB()) {
				String sql = "SELECT * FROM sensors WHERE enabled=true";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
						  s.add(rs.getString("devicename"));
						}
					}
				}			
				ObjectMapper m = new ObjectMapper();
				String json = m.writeValueAsString(s);
				return Response.ok().entity(json).build();
			}
			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
	}
	
	@Override
	public Response getActuators() {
		try {
			List<String> s = new ArrayList<>();
			try(Connection con = ConnectDB()) {
				String sql = "SELECT * FROM actuators WHERE enabled=true";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
						  s.add(rs.getString("devicename"));
						}
					}
				}
				
				ObjectMapper m = new ObjectMapper();
				String json = m.writeValueAsString(s);
				return Response.ok().entity(json).build();
			}
			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public Response updateScript(String rule) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			Rule newRule = mapper.readValue(rule,Rule.class);
			try(Connection con = ConnectDB()) {
				String sql = "UPDATE intelligenthome.scripts SET name=?,sensorlist=?,actuatorlist=?,script=?,enabled=? WHERE id=?";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					ps.setString(1, newRule.getName());
					ps.setString(2, String.join(",",newRule.getSensors()));
					ps.setString(3, String.join(",",newRule.getActuators()));
					ps.setString(4, newRule.getCodetext());
					ps.setBoolean(5, newRule.isEnabled());
					ps.setInt(6, newRule.getId());
					ps.executeUpdate();
					
					MqttComunicator.SendMessageMQTT(MqttComunicator.UPDATER_TOPIC, "PLANNER:SCRIPTS:" + newRule.getId());
				}
			}			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
		return OK;
	}

	@Override
	public Response getScripts() {
		Rule tempRule = null;
		ObjectMapper m = new ObjectMapper();
		try {
			List<String> s = new ArrayList<>();
			try(Connection con = ConnectDB()) {
				String sql = "SELECT * FROM scripts";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
							tempRule = new Rule();
							tempRule.setId(rs.getInt("id"));
							tempRule.setName(rs.getString("name"));
							tempRule.setSensors(Arrays.asList(rs.getString("sensorlist").split(",")));
							tempRule.setActuators(Arrays.asList(rs.getString("actuatorlist").split(",")));
							tempRule.setCodetext(rs.getString("script"));
							tempRule.setEnabled(rs.getBoolean("enabled"));
							s.add(m.writeValueAsString(tempRule));
						}
					}
				}			
				String json = m.writeValueAsString(s);
				return Response.ok().entity(json).build();
			}
			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public Response getAllDevices() {
		try {
			List<String> s = new ArrayList<>();
			try(Connection con = ConnectDB()) {
				String sql = "SELECT * FROM sensors WHERE enabled=true";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
						  s.add("SENSOR:"+rs.getString("devicename"));
						}
					}
				}			
				
				sql = "SELECT * FROM actuators WHERE enabled=true";
				try(PreparedStatement ps = con.prepareStatement(sql)) {
					try(ResultSet rs = ps.executeQuery()) {
						while(rs.next()) {
						  s.add("ACTUATOR:"+rs.getString("devicename"));
						}
					}
				}	
				
				ObjectMapper m = new ObjectMapper();
				String json = m.writeValueAsString(s);
				return Response.ok().entity(json).build();
			}
			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public Response getHistoryData(String[] devices, int days) {
		try {
			Map<String, List<History>> s = new HashMap<>();
			try(Connection con = ConnectDB()) {
				for(String dev : devices) {
					String[] devPart = dev.split(":");
					String sql = "SELECT observation, value FROM ";
					if("SENSOR".equalsIgnoreCase(devPart[0])) {
						sql+="sensordata WHERE sensorname = ?";
					}
					else {
						sql+="actuatordata WHERE actuatorname = ?";
					}
					sql += " AND (observation BETWEEN ? AND ?) ORDER BY observation";
					try(PreparedStatement ps = con.prepareStatement(sql)) {
						ps.setString(1, devPart[1]);
						LocalDateTime now = LocalDateTime.now();
						LocalDateTime before = now.minus(Period.ofDays(days));
						ps.setTimestamp(2, Timestamp.valueOf(before));
						ps.setTimestamp(3, Timestamp.valueOf(now));
						List<History> lh = new ArrayList<>();
						try(ResultSet rs = ps.executeQuery()) {
							while(rs.next()) {
							  String v = rs.getString("value");
							  try {
								  Double.parseDouble(v);
							  }
							  catch(NumberFormatException nfe) {
								  if("true".equalsIgnoreCase(v)) {
									  v = "20";
								  }
								  else {
									  v = "10";
								  }
							  }
							  lh.add(new History(rs.getTimestamp("observation"), v));
							}
						}
						
						s.put(dev, lh);
					}
				}
				
				ObjectMapper m = new ObjectMapper();
				String json = m.writerWithDefaultPrettyPrinter().writeValueAsString(s);
				return Response.ok().entity(json).build();
			}
			
		} catch (JsonParseException | JsonMappingException e) {
			e.printStackTrace();
			return BAD_REQUEST;
		} catch (Exception e) {
			e.printStackTrace();
			return INTERNAL_SERVER_ERROR;
		}
	}
	
	@XmlRootElement
	class History {
		public Timestamp datetime;
		public String value;
		
		public History(Timestamp datetime, String value) {
			this.datetime = datetime;
			this.value = value;
		}
	}
}
