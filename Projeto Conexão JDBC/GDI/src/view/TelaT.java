package view;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import dao.DataSource;
import dao.EventoDAO;
import dao.PessoaDAO;
import dao.StaffDAO;
import model.Evento;
import model.Pessoa;
import model.Staff;

import javax.swing.JTextArea;
import javax.swing.JButton;
import javax.swing.JList;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import java.awt.Label;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Color;
import javax.swing.JTextPane;
import javax.swing.JScrollPane;

public class TelaT extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					TelaT frame = new TelaT();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public TelaT() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 646, 480);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		/**
		 * TODO adicionar acoes
		*/
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(32, 123, 536, 279);
		contentPane.add(scrollPane);
		
		JTextPane textPane = new JTextPane();
		scrollPane.setViewportView(textPane);
		
		
		JLabel lblConsulta = new JLabel("Consultas:");
		lblConsulta.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblConsulta.setBounds(32, 13, 71, 16);
		contentPane.add(lblConsulta);
		
		JButton btnConsultarEventos = new JButton("Consultar Eventos");
		btnConsultarEventos.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				textPane.setText("");
				DataSource dataSource = new DataSource();
				EventoDAO eventodao = new EventoDAO(dataSource);
				ArrayList<Evento> lista = EventoDAO.readAll();
				if(lista!=null) {
					for(Evento e:lista) {
						textPane.setText(textPane.getText()+ "ID: " + e.getIdEvento() + "  |  CPF Cliente: "+ e.getCpfCliente()+"  |    Valor: "+ e.getValor()+"\n");
					}
				}
				dataSource.closeDataSource();
			
			}
		});
		
		btnConsultarEventos.setBounds(233, 64, 142, 25);
		contentPane.add(btnConsultarEventos);
		
		JButton btnConsultarStaff = new JButton("Consultar Staff");
		btnConsultarStaff.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				textPane.setText("");
				DataSource dataSource = new DataSource();
				StaffDAO staffdao = new StaffDAO(dataSource);
				ArrayList<Staff> lista = StaffDAO.readAll();
				if(lista!=null) {
					for(Staff s:lista) {
						textPane.setText(textPane.getText()+ "CPF: " + s.getCpf() + "  |  Salario: "+ s.getSalario()+"  "
								+ " | CPF Coordenador: "+ s.getCpfCoordenador()+ "\n");
					}
				}
				dataSource.closeDataSource();
				
			}
		});
		btnConsultarStaff.setBounds(407, 64, 142, 25);
		contentPane.add(btnConsultarStaff);
		
		JButton btnConsultar = new JButton("Consultar Pessoas");
		btnConsultar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
					textPane.setText("");
					DataSource dataSource = new DataSource();
					PessoaDAO pessoadao = new PessoaDAO(dataSource);
					ArrayList<Pessoa> lista = PessoaDAO.readAll();
					if(lista!=null) {
						for(Pessoa p:lista) {
							textPane.setText(textPane.getText()+ "CPF: " + p.getCpf() + "  |  Nome: "+ p.getNome()+"\n");
						}
					}
					dataSource.closeDataSource();
				}
		});
			
		btnConsultar.setBounds(55, 64, 142, 25);
		contentPane.add(btnConsultar);
	
	}
}