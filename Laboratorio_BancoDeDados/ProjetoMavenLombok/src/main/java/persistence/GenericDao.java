package persistence;

import java.sql.Connection;
import java.sql.DriverManager;

public class GenericDao {
	public Connection getConnection() throws Exception{
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		String url = "jdbc:jtds:sqlserver://MARYJANE:1433/crud_maven";
		String usuario = "usuario";
		String senha = "123456";
		
		return DriverManager.getConnection(url, usuario, senha);
		
	}
}
