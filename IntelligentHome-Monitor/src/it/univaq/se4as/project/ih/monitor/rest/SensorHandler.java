package it.univaq.se4as.project.ih.monitor.rest;

import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.ServiceReference;

import it.univaq.se4as.project.ih.api.Sensor;
import it.univaq.se4as.project.ih.api.data.Configuration;
import it.univaq.se4as.project.ih.api.mqtt.MQTTParams;
import it.univaq.se4as.project.ih.monitor.MonitorActivator;

@Path("api")
public class SensorHandler {
	private JSONParser parser = new JSONParser();
	private Map<String, Sensor<?>> sensors;
	MqttClient client;
	
	public SensorHandler() throws Exception {
		sensors = getConfiguration().getSensors(false);
		if(sensors==null) throw new Exception("[IntelligentHome:SensorHandler] Sensors not loaded. Quitting!");
		
		client = new MqttClient(MQTTParams.MQTT_HOST, getClass().getName());
		client.connect();
		
		System.out.println("[IntelligentHome:SensorHandler] Started on URL [/api].");
	}
	
	@POST
	@Consumes({MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON})
	@Path("sensor")
	@SuppressWarnings("unchecked")
	public Response updateSensorData(String sensorData) {
		try {
			System.out.println("[IntelligentHome:SensorHandler] Recevied REST="+sensorData);
			JSONObject obj = (JSONObject)parser.parse(sensorData);
			
			String sensorName = String.valueOf(obj.get("name"));
			String newValue = String.valueOf(obj.get("value"));
			Sensor<?> sensor = sensors.get(sensorName);
			if(sensor!=null) {
				Object oldValue = sensor.getValue();
				System.out.println("[IntelligentHome:SensorHandler] Found device "+sensor+" new value: "+newValue+", old value: "+oldValue);
				
				obj = new JSONObject();
				obj.put("name", sensor.getName());
				obj.put("measureUnit", sensor.getMeasureUnit());
				obj.put("value", newValue);
				
				MqttMessage message = new MqttMessage(obj.toJSONString().getBytes());
				client.publish(MQTTParams.ANALYER_TOPIC, message);
				
				return Response.ok().build();
			}
			else {
				System.out.println("[IntelligentHome:SensorHandler] Device "+sensorName+" unauthorized!");
				return Response.status(Response.Status.UNAUTHORIZED).build();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return Response.serverError().entity("[IntelligentHome:SensorHandler] Error: "+e.toString()).build();
		}
	}
	
	/**
	 * 
	 * @return
	 * @throws InvalidSyntaxException
	 */
	protected final Configuration getConfiguration() throws InvalidSyntaxException {
		BundleContext bc = FrameworkUtil.getBundle(MonitorActivator.class).getBundleContext();
		ServiceReference<?>[] refs = bc.getAllServiceReferences(Configuration.REFERENCE, null);
		if(refs.length==1) {
			return (Configuration)bc.getService(refs[0]);
		}
		return null;
	}
}
