package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Staff;

public class StaffDAO {
	private static DataSource datasource; //datasource para fazer a conexao
	
	public StaffDAO(DataSource datasource) {
		StaffDAO.datasource = datasource;
	}
	
	public static ArrayList<Staff> readAll(){
		try {
			String SQL = "SELECT * FROM staff"; //consulta
			PreparedStatement ps = datasource.getConnection().prepareStatement(SQL);
			ResultSet rs = ps.executeQuery();
			
			/**
			 * recebe resultados da consulta e armazena no arraylist "lista" que eh retornado
			*/
			ArrayList<Staff> lista = new ArrayList<Staff>();
			while(rs.next()) {
				Staff staff = new Staff();
				staff.setCpf(rs.getString("cpf_p"));
				staff.setSalario(rs.getDouble("salario"));
				staff.setCpfCoordenador(rs.getString("cpf_p"));
				lista.add(staff);
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
