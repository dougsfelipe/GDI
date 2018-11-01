package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Pessoa;

public class PessoaDAO {
	private static DataSource datasource; //datasource para fazer a conexao
	
	public PessoaDAO(DataSource datasource) {
		this.datasource = datasource;
	}
	
	public static ArrayList<Pessoa> readAll(){
		try {
			String SQL = "SELECT * FROM pessoa"; //consulta
			PreparedStatement ps = datasource.getConnection().prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			
			/**
			 * recebe resultados da consulta e armazena no arraylist "lista" que eh retornado
			*/
			ArrayList<Pessoa> lista = new ArrayList<Pessoa>();
			while(rs.next()) {
				Pessoa pessoa = new Pessoa();
				pessoa.setCpf(rs.getString("cpf"));
				
				pessoa.setNome(rs.getString("nome"));			
				lista.add(pessoa);
			}
			ps.close(); //fecha statement
			return lista;
			
		} catch (SQLException ex) {
			System.err.println("erro ao recuperar: " + ex.getMessage());
		}catch (Exception ex) {
			System.err.println("erro geral: " + ex.getMessage());
		}
		return null;
	}
}
