CREATE TABLE pessoa (
	cpf VARCHAR(15) ,
	nome VARCHAR(255) NOT NULL,
	CONSTRAINT pessoa_pk PRIMARY KEY(CPF)
	
);
CREATE TABLE endereco_pessoa (
	cpf_pessoa VARCHAR(15),
	cep VARCHAR(10) NOT NULL,
	bairro VARCHAR(255),
	complemento VARCHAR(150),
	numero NUMBER NOT NULL,
	rua VARCHAR(255),
	estado VARCHAR(255),
	pais VARCHAR (255),
	cidade VARCHAR(255),
	CONSTRAINT endereco_pessoa_pk PRIMARY KEY(cpf_pessoa),
	CONSTRAINT endereco_pessoa_cpf_fk FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)
	
);


CREATE TABLE telefone_pessoa (
	telefone VARCHAR(20),
	cpf_p VARCHAR(15),
	CONSTRAINT telefone_pessoa_pk PRIMARY KEY (telefone,cpf_p)
);

CREATE TABLE cliente(
cpf_p VARCHAR(15),
CONSTRAINT cliente_pk PRIMARY KEY (cpf_p),
	CONSTRAINT cpf_fk FOREIGN KEY (cpf_p) references pessoa(cpf)
);
CREATE TABLE status(
	cpf_c VARCHAR(15),
	status VARCHAR(15),
	CONSTRAINT status_pk PRIMARY KEY(cpf_c,status),
	CONSTRAINT cpf_c_status_fk FOREIGN KEY (cpf_c) references cliente(cpf_p)
);

CREATE TABLE id(
	cpf_c VARCHAR(15),
	id INTEGER,
	CONSTRAINT id_pk PRIMARY KEY (cpf_c,id),
	CONSTRAINT cpf_c_id_fk FOREIGN KEY (cpf_c) REFERENCES cliente(cpf_p) 
);

CREATE TABLE servico(
	id INTEGER,
	CONSTRAINT servico_pk PRIMARY KEY (id)
);
CREATE TABLE evento(
	id INTEGER,
	cpf_c VARCHAR(15) NOT NULL,
	id_s INTEGER NOT NULL,
	convidados NUMBER,
	valor NUMBER NOT NULL,
	data DATE NOT NULL,
	data_admissao DATE NOT NULL,
	CONSTRAINT evento_pk PRIMARY KEY (id),
	CONSTRAINT cpf_c_fk FOREIGN KEY (cpf_c) REFERENCES cliente(cpf_p),
	CONSTRAINT id_s_fk FOREIGN KEY (id_s) REFERENCES servico(id)
	 
);
CREATE TABLE endereco_evento(
	id_e INTEGER,
	cep VARCHAR (15) NOT NULL,
	bairro VARCHAR(255),
	complemento VARCHAR(255),
	numero NUMBER NOT NULL,
	rua VARCHAR(255),
	estado VARCHAR(255),
	pais VARCHAR(255),
	cidade VARCHAR(255),
	CONSTRAINT endereco_evento_pk PRIMARY KEY (id_e),
	CONSTRAINT id_e_fk FOREIGN KEY (id_E) REFERENCES evento(id)
);

CREATE TABLE staff(
	cpf_p VARCHAR(15),
	salario NUMBER NOT NULL,
	coordenador_cpf VARCHAR(15),
	CONSTRAINT staff_pk PRIMARY KEY (cpf_p),
	CONSTRAINT cpf_p_fk FOREIGN KEY (cpf_p) REFERENCES pessoa(cpf),
	CONSTRAINT coordenador_cpf_fk FOREIGN KEY (coordenador_cpf) REFERENCES staff(cpf_p),
	CHECK (salario>=954.00)
);
CREATE TABLE funcao(
	funcao VARCHAR(255),
	cpf_s VARCHAR(15),
	CONSTRAINT funcao_pk PRIMARY KEY(funcao,cpf_s),
	CONSTRAINT cpf_s_fk FOREIGN KEY (cpf_s) REFERENCES staff(cpf_p)
);

CREATE TABLE tipo_contrato(
	tipo VARCHAR(255),
	cpf_s VARCHAR(15),
	CONSTRAINT tipo_contrato_pk PRIMARY KEY (tipo,cpf_s),
	CONSTRAINT cpf_s_tipo_contrato_fk FOREIGN KEY (cpf_s) REFERENCES staff(cpf_p)
);


CREATE TABLE utensilio(
	nome VARCHAR(255),
	id INTEGER,
	valor NUMBER NOT NULL,
	quantidade NUMBER NOT NULL,
	CONSTRAINT  utensilio_pk PRIMARY KEY (id)
);
CREATE TABLE utilizar(
	id_u INTEGER,
	cpf_s VARCHAR(15),
	CONSTRAINT utilizar_pk PRIMARY KEY (cpf_s,id_u),
	CONSTRAINT cpf_s_utilizar_fk FOREIGN KEY  (cpf_s) REFERENCES staff(cpf_p),
	CONSTRAINT id_u_fk FOREIGN KEY (id_u) REFERENCES utensilio(id)
);
CREATE TABLE alimentos(
	id INTEGER,
	nome VARCHAR(255) NOT NULL,
	valor NUMBER NOT NULL,
	peso NUMBER NOT NULL,
	quantidade NUMBER NOT NULL,
	CONSTRAINT alimentos_pk PRIMARY KEY (id)
);
CREATE TABLE tipo_alimento (
	tipo VARCHAR(255),
	id_a INTEGER,
	CONSTRAINT tipo_alimentos_pk PRIMARY KEY(tipo,id_a),
	CONSTRAINT id_a_fk FOREIGN KEY (id_a) REFERENCES alimentos(id) 
);

CREATE TABLE fornece(
	id_u INTEGER,
	id_a INTEGER,
	CONSTRAINT fornece_pk PRIMARY KEY (id_u,id_a),
	CONSTRAINT id_u_fornece FOREIGN KEY (id_u) REFERENCES utensilio(id),
	CONSTRAINT id_a_fornece FOREIGN KEY (id_a) REFERENCES alimentos(id)
);

CREATE TABLE convidado(
	nome VARCHAR(255),
	cpf_p VARCHAR(15),
	idade VARCHAR(3),
	CONSTRAINT convidado_pk  PRIMARY KEY (nome,cpf_p),
	CONSTRAINT cpf_convidado_fk FOREIGN KEY (cpf_p) references pessoa(cpf)
); 

CREATE SEQUENCE id_utensilio
INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE id_alimento
 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE id_e
INCREMENT BY 1 START WITH 1;

