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
import dao.PessoaDAO;
import model.Pessoa;

import javax.swing.JTextArea;
import javax.swing.JButton;
import javax.swing.JList;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;

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
		setBounds(100, 100, 803, 626);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JTextArea textArea = new JTextArea();
		textArea.setBounds(32, 150, 720, 416);
		contentPane.add(textArea);
		
		JButton btnPessoas = new JButton("Pessoas");
		btnPessoas.setBounds(32, 25, 97, 25);
		contentPane.add(btnPessoas);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(new String[] {"Listar Clientes", "Listar Eventos", "Listar Endere\u00E7os", "Pessoa + Endere\u00E7o"}));
		comboBox.setToolTipText("");
		comboBox.setBounds(432, 58, 147, 22);
		contentPane.add(comboBox);
		
		JButton btnConsultar = new JButton("Consultar");
		btnConsultar.setBounds(589, 57, 97, 25);
		contentPane.add(btnConsultar);
		btnPessoas.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				DataSource dataSource = new DataSource();
				PessoaDAO pessoaDao = new PessoaDAO(dataSource);
				ArrayList<Pessoa> lista = pessoaDao.readAll();
				textArea.setText(textArea.getText()+ "Nome"+ "\n");
				if(lista!=null) {
					for(Pessoa p : lista) {
						textArea.setText(textArea.getText()+ p.getNome()+ "\n");
					}
				}
				dataSource.closeDataSource();
			}
		});
	}
}
