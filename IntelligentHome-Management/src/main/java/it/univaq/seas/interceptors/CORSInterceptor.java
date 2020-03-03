package it.univaq.seas.interceptors;

import org.apache.cxf.interceptor.AbstractOutDatabindingInterceptor;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.Phase;

public class CORSInterceptor extends AbstractOutDatabindingInterceptor {
	public CORSInterceptor() {
		super(Phase.MARSHAL);
		System.out.println("CORS Interceptor");
	}

	@Override
	public void handleMessage(Message message) throws Fault {
//		System.out.println("Handle Message");
//		Map<String, List<String>> headers = (Map<String, List<String>>)message.get(Message.PROTOCOL_HEADERS);
//		headers.put("Access-Control-Allow-Origin", Collections.singletonList("*"));
//		headers.put("Access-Control-Allow-Credentials", Collections.singletonList("true"));
//		headers.put("Access-Control-Allow-Headers",  Collections.singletonList("origin, content-type, accept, authorization, device-id"));
//		headers.put("Access-Control-Allow-Methods",  Collections.singletonList("GET, POST, PUT, DELETE, OPTIONS, HEAD"));
//		message.put(Message.PROTOCOL_HEADERS,headers);
	}
}
