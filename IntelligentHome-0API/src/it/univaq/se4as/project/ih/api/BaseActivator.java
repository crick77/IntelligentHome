package it.univaq.se4as.project.ih.api;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.ServiceReference;

import it.univaq.se4as.project.ih.api.data.Configuration;
import it.univaq.se4as.project.ih.api.data.History;
import it.univaq.se4as.project.ih.api.data.Scripts;

public abstract class BaseActivator implements BundleActivator {
	private BundleContext context;
	
	protected final BundleContext getContext() {
		return context;
	}

	public final void start(BundleContext bundleContext) throws Exception {
		context = bundleContext;
		localStart();
	}
	
	public void stop(BundleContext bundleContext) throws Exception {
		context = null;
		localStop();
	}
	
	public final Configuration getConfiguration() throws InvalidSyntaxException {
		ServiceReference<?>[] refs = getContext().getAllServiceReferences(Configuration.REFERENCE, null);
		if(refs.length==1) {
			return (Configuration)getContext().getService(refs[0]);
		}
		return null;
	}
	
	public final History getHistory() throws InvalidSyntaxException {
		ServiceReference<?>[] refs = getContext().getAllServiceReferences(History.REFERENCE, null);
		if(refs.length==1) {
			return (History)getContext().getService(refs[0]);
		}
		return null;
	}
	
	public final Scripts getScripts() throws InvalidSyntaxException {
		ServiceReference<?>[] refs = getContext().getAllServiceReferences(Scripts.REFERENCE, null);
		if(refs.length==1) {
			return (Scripts)getContext().getService(refs[0]);
		}
		return null;
	}
	
	public abstract void localStart() throws Exception;
	public abstract void localStop() throws Exception;
}
