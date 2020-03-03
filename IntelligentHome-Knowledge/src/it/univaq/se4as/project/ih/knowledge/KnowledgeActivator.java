package it.univaq.se4as.project.ih.knowledge;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

import it.univaq.se4as.project.ih.api.data.Configuration;
import it.univaq.se4as.project.ih.api.data.History;
import it.univaq.se4as.project.ih.api.data.Scripts;

public class KnowledgeActivator implements BundleActivator {

	private static BundleContext context;

	static BundleContext getContext() {
		return context;
	}

	public void start(BundleContext bundleContext) throws Exception {
		KnowledgeActivator.context = bundleContext;
		
		Configuration c = new Configuration();
		context.registerService(Configuration.REFERENCE, c, null);
		System.out.println("[IntelligentHome:KnowledgeActivator] Configuration registerd.");
		History h = new History();
		context.registerService(h.getClass().getName(), h, null);
		System.out.println("[IntelligentHome:KnowledgeActivator] History registerd.");
		Scripts s = new Scripts();
		context.registerService(s.getClass().getName(), s, null);
		System.out.println("[IntelligentHome:KnowledgeActivator] Scripts registerd.");
	}

	public void stop(BundleContext bundleContext) throws Exception {
		KnowledgeActivator.context = null;
	}

}
