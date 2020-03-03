package it.univaq.se4as.project.ih.api.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseService {
	public BaseService() throws ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
	}
	
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:postgresql:postgres?currentSchema=intelligenthome", "postgres", "Siemens123"); 
	}
}
