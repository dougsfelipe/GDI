package model;

public class Evento {
	
	private int idEvento, convidados, idServico;
	
	private double valor;
	private String cpfCliente;
	
	
	public int getIdServico() {
		return idServico;
	}
	public void setIdServico(int idServico) {
		this.idServico = idServico;
	}
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	public int getConvidados() {
		return convidados;
	}
	public void setConvidados(int convidados) {
		this.convidados = convidados;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public String getCpfCliente() {
		return cpfCliente;
	}
	public void setCpfCliente(String cpfCliente) {
		this.cpfCliente = cpfCliente;
	}
}
