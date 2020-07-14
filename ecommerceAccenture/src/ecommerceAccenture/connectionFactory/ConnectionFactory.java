package ecommerceAccenture.connectionFactory;

import java.sql.*;
public class ConnectionFactory {
	String driverClassName ="oracle.jdbc.driver.OracleDriver";
	String connectionURL = "jdbc:oracle:thin:@marte.etlforma.com:8521:xe";
	String dbUser = "";
	String dbPWD = "";

	private static ConnectionFactory connectionFactory = null;
	private ConnectionFactory() {

		try {
			Class.forName(driverClassName);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
	}
	public Connection getConnection() {

		Connection conn = null;  
		try {
			conn=DriverManager.getConnection(connectionURL,dbUser,dbPWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn; 

	}
public static ConnectionFactory getIstance() {
		
		if (connectionFactory == null) {
			
			connectionFactory = new ConnectionFactory();
		}
		
		return connectionFactory;
	}

}
