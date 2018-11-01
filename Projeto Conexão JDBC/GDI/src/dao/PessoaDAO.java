package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Pessoa;

public class PessoaDAO {
	private static DataSource datasource;
	
	public PessoaDAO(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public static ArrayList<Pessoa> readAll(){
		try {
			String SQL = "SELECT * FROM pessoa";
			PreparedStatement ps = datasource.getConnection().prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Pessoa> lista = new ArrayList<Pessoa>();
			while(rs.next()) {
				Pessoa pessoa = new Pessoa();
				pessoa.setCpf(rs.getString("cpf"));
				
				pessoa.setNome(rs.getString("nome"));
				//cli.setEmail(rs.getString("email"));
				//cli.setTelefone(rs.getString("telefone"));			
				lista.add(pessoa);
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
