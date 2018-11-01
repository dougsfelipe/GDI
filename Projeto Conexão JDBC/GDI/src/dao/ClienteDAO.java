package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Cliente;

public class ClienteDAO {
	private DataSource datasource;
	
	public ClienteDAO(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public ArrayList<Cliente> readAll(){
		try {
			String SQL = "SELECT * FROM cliente";
			PreparedStatement ps = datasource.getConnection().prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Cliente> lista = new ArrayList<Cliente>();
			while(rs.next()) {
				Cliente cli = new Cliente();
				cli.setCpf(rs.getString("cpf_p"));
				
				//cli.setNome(rs.getString("nome_p"));
				//cli.setEmail(rs.getString("email"));
				//cli.setTelefone(rs.getString("telefone"));			
				lista.add(cli);
			}
			ps.close();
			return lista;
			
		} catch (SQLException ex) {
			System.err.println("erro ao recuperar: " + ex.getMessage());
		}catch (Exception ex) {
			System.err.println("erro geral: " + ex.getMessage());
		}
		return null;
	}
}
