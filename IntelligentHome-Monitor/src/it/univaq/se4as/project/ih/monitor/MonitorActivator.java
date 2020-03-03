package it.univaq.se4as.project.ih.monitor;

import java.net.InetAddress;
import java.net.URI;
import java.net.UnknownHostException;

import javax.ws.rs.core.UriBuilder;

import org.glassfish.jersey.jdkhttp.JdkHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

import com.sun.net.httpserver.HttpServer;

import it.univaq.se4as.project.ih.api.BaseActivator;
import it.univaq.se4as.project.ih.monitor.rest.SensorHandler;

public class MonitorActivator extends BaseActivator {
	private HttpServer httpServer;

	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#start(org.osgi.framework.BundleContext)
	 */
	public void localStart() throws Exception {
		System.out.println("[IntelligenHome:MonitorActivator] Starting...");
			
		// Start RestServer
		httpServer = createHttpServer();
		System.out.println("[IntelligenHome:MonitorActivator] Server created!");
		new Thread() {
			public void run() {
				httpServer.start();
			}
		};
		System.out.println("[IntelligenHome:MonitorActivator] Jersey Server started on ["+getURI()+"].");
	}

	/*
	 * (non-Javadoc)
	 * @see org.osgi.framework.BundleActivator#stop(org.osgi.framework.BundleContext)
	 */
	public void localStop() throws Exception {
		if(httpServer!=null) {
			httpServer.stop(0);
			System.out.println("[IntelligenHome:MonitorActivator] Jersey Server stopped.");
		}
	}

	private static HttpServer createHttpServer() throws Exception {
        ResourceConfig rc = new ResourceConfig();
       	rc.registerInstances(new SensorHandler());
       	
        return JdkHttpServerFactory.createHttpServer(getURI(), rc);
    }
	
	private static URI getURI() {
        return UriBuilder.fromUri("http://" + getHostName() + "/rest").port(8085).build();
    }
 
    private static String getHostName() {
        String hostName = "localhost";
        try {
            hostName = InetAddress.getLocalHost().getCanonicalHostName();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return hostName;
    }
}
