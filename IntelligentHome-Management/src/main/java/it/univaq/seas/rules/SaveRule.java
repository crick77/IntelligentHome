package it.univaq.seas.rules;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/services")
public interface SaveRule {
	
	@POST
	@Path("/saverule")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.TEXT_PLAIN)
	public Response saveRule(String rule);
	
	@GET
	@Path("/getSensors")
	@Produces(MediaType.TEXT_PLAIN)
	public Response getSensors();
	
	@GET
	@Path("/getActuators")
	@Produces(MediaType.TEXT_PLAIN)
	public Response getActuators();
	
	@GET
	@Path("/getScripts")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getScripts(); 
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.TEXT_PLAIN)
	public Response updateScript(String rule);

	
	@GET
	@Path("/getAllDevices")
	@Produces(MediaType.TEXT_PLAIN)
	public Response getAllDevices();
	
	@GET
	@Path("/getHistoryData")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getHistoryData(@QueryParam("devices") String[] devices, @QueryParam("days") int days);
}
