package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {
	private String hostname;
	private int port;
	private String username;
	private String password;
	
	private Connection connection;
	
	public DataSource() {
		/**
		 * realiza a conexao
		*/
		try {
			hostname = "localhost";
			port = 1521;
			username = "gdi";
			password = "gdi";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@"+hostname+":"+port+":xe", username, password);

			
			System.out.println("Deu certo!");
			
		} catch (SQLException ex) {
			System.err.println("Erro na conexão: " + ex.getMessage());
		}catch (Exception ex) {
			System.err.println("Erro geral: " + ex.getMessage());
		}
	}
	public Connection getConnection() {
		return this.connection;
	}
	public void closeDataSource(){
		try {
			connection.close();
		} catch (Exception ex) {
			System.err.println("Erro ao conectar "+ ex.getMessage());
		}
	}
}
