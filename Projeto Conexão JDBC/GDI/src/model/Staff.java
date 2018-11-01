package model;

public class Staff extends Pessoa{
	
	private double salario;
	private String cpfCoordenador;
	
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	public String getCpfCoordenador() {
		return cpfCoordenador;
	}
	public void setCpfCoordenador(String cpfCoordenador) {
		this.cpfCoordenador = cpfCoordenador;
	}
	
}
