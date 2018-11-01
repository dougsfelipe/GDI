package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Evento;

public class EventoDAO {
	private static DataSource datasource; //datasource para fazer a conexao
	
	public EventoDAO(DataSource datasource) {
		EventoDAO.datasource = datasource;
	}
	
	public static ArrayList<Evento> readAll(){
		try {
			String SQL = "SELECT * FROM evento"; //consulta
			PreparedStatement ps = datasource.getConnection().prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			
			/**
			 * recebe resultados da consulta e armazena no arraylist "lista" que eh retornado
			*/
			ArrayList<Evento> lista = new ArrayList<Evento>();
			while(rs.next()) {
				Evento evento = new Evento();
				evento.setIdEvento(rs.getInt("id"));
				
				evento.setCpfCliente(rs.getString("cpf_c"));
				
				evento.setIdServico(rs.getInt("id_s"));
				
				evento.setConvidados(rs.getInt("convidados"));
				
				evento.setValor(rs.getDouble("valor"));
				
				lista.add(evento);
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
