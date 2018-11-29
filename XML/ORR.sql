--Dropando os bagulho
DROP TABLE tb_fornece;
DROP TABLE tb_convidado;
DROP TABLE tb_utensilio;
DROP TABLE tb_alimentos;
DROP TABLE tb_evento;
DROP TABLE tb_servico;
DROP TABLE tb_staff;
DROP TABLE tb_cliente;
DROP TABLE tb_pessoa;
DROP TABLE tb_endereco;
DROP TABLE tb_fones;
DROP TYPE tp_fornece;
DROP TYPE tp_convidado;
DROP TYPE tp_evento;
DROP TYPE tp_servico;
DROP TYPE tp_staff;
DROP TYPE tp_cliente;
DROP TYPE tp_pessoa;
DROP TYPE tp_endereco;
DROP TYPE tb_status;
DROP TYPE varray_funcao;
DROP TYPE tp_funcao;
DROP TYPE varray_fones;
DROP TYPE tp_fones;
DROP TYPE tp_utensilio;
DROP TYPE tp_alimentos;

-- Criação dos tipos

--Telefone
CREATE OR REPLACE TYPE tp_fones AS OBJECT(
	telefone varchar2(8)
)NOT FINAL;
/
--Varray telefones
CREATE OR REPLACE TYPE varray_fones AS VARRAY(5) OF tp_fones;
/


--Função
CREATE OR REPLACE TYPE tp_funcao AS OBJECT(
	funcao varchar(255)
)NOT FINAL;
/
--Varray função
CREATE OR REPLACE TYPE varray_funcao AS VARRAY(3) OF tp_funcao;
/
--Status
CREATE OR REPLACE TYPE tb_status AS varray(3) OF VARCHAR2(255);
--Endereço
/
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
	rua varchar2(30),
	numero varchar2(5),
	complemento varchar2(30),
	bairro varchar2(30),
	cidade varchar2(30),
	estado varchar2(30),
	pais varchar2(30),
	cep varchar2(10)
)NOT FINAL;
/

--Pessoa

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
cpf varchar2(15),
nome varchar2(50),
	endereco xmltype,
	fones varray_fones,
	datanasc date,
	sexo char(1)
--MEMBER PROCEDURE exibir_detalhes (SELF tp_pessoa)
)NOT FINAL;
/








CREATE OR REPLACE TYPE BODY tp_pessoa AS 
	MEMBER PROCEDURE exibir_detalhes(SELF tp_pessoa) IS
	n INTEGER;
	i INTEGER;
	BEGIN
		DBMS_OUTPUT.put_line('Sobre a pessoa');
		DBMS_OUTPUT.put_line('NOME: ' || nome);
		DBMS_OUTPUT.put_line('CPF: ' || cpf);
		DBMS_OUTPUT.put_line('SEXO: ' || sexo);
		DBMS_OUTPUT.put_line('Data de nascimento: ' || TO_CHAR(datanasc));

		n := fones.count;
		DBMS_OUTPUT.put_line('Telefones: ');
		if n > 0 then
			for i in 1..n loop
				DBMS_OUTPUT.put_line(i || fones(i).telefone);
			end loop;
		else
			DBMS_OUTPUT.put_line('Não há telefones registrados.');
		end if;
		
		DBMS_OUTPUT.put_line('ENDEREÇO: ');
		DBMS_OUTPUT.put_line('RUA: ' || endereco.rua);
		DBMS_OUTPUT.put_line('Nº: ' || endereco.numero);
		DBMS_OUTPUT.put_line('COMPLEMENTO: ' || endereco.complemento);
		DBMS_OUTPUT.put_line('BAIRRO: ' || endereco.bairro);
		DBMS_OUTPUT.put_line('CIDADE: ' || endereco.cidade);
		DBMS_OUTPUT.put_line('ESTADO: ' || endereco.estado);
		DBMS_OUTPUT.put_line('PAÍS: ' || endereco.pais);
		DBMS_OUTPUT.put_line('CEP: ' || endereco.cep);
	END;
END;
/
CREATE OR REPLACE TYPE tp_alimentos AS OBJECT(
	id integer,
	valor number,
	peso float,
	quantidade integer
)NOT FINAL;
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
	status tb_status,
	id number
)NOT FINAL;

/
CREATE OR REPLACE TYPE tp_staff UNDER tp_pessoa(
funcao varray_funcao,
salario FLOAT,
tipo_contrato VARCHAR2(255),
cpf_cord varchar2(15)
)NOT FINAL;
/
CREATE OR REPLACE TYPE tp_utensilio AS OBJECT(
	id integer,
	valor number
)NOT FINAL;
/
CREATE OR REPLACE TYPE tp_convidado AS OBJECT(
	nome VARCHAR2(255),
	idade integer
)NOT FINAL;
/
CREATE OR REPLACE TYPE tp_servico AS OBJECT (
	id integer,
	staffs tp_staff,
	alimentos tp_alimentos,
	utensilio tp_utensilio
)NOT FINAL;
/

CREATE OR REPLACE TYPE tp_evento AS OBJECT(
	id REF tp_servico,
cpf REF tp_pessoa,
	datadeadmissao date,
	data date,
	local tp_endereco,
	convidados varchar2(50),
	valor number
)NOT FINAL;
/

CREATE  TYPE tp_fornece AS OBJECT(
	id_ult REF tp_utensilio,
	id_ali REF tp_alimentos
)not final;
	


-- Criação das tabelas

/
CREATE TABLE tb_fones OF tp_fones;
/
CREATE TABLE tb_endereco of tp_endereco(rua NOT NULL, numero NOT NULL, complemento NOT NULL, bairro NOT NULL, cidade NOT NULL, estado NOT NULL, pais NOT NULL, cep NOT NULL);
/
CREATE TABLE tb_pessoa of tp_pessoa(cpf PRIMARY KEY, nome NOT NULL, endereco NOT NULL, fones NOT NULL, datanasc NOT NULL, sexo NOT NULL);
/
CREATE TABLE tb_cliente of tp_cliente(cpf primary key);
/
CREATE TABLE tb_staff of tp_staff(funcao NOT NULL, salario NOT NULL, tipo_contrato NOT NULL);
/
CREATE TABLE tb_servico of tp_servico(id PRIMARY KEY, staffs NOT NULL, alimentos NOT NULL, utensilio NOT NULL);
/
CREATE TABLE tb_evento of tp_evento (datadeadmissao NOT NULL, data NOT NULL, local NOT NULL, convidados NOT NULL, valor NOT NULL);
/
CREATE TABLE tb_alimentos of tp_alimentos(id PRIMARY KEY, valor NOT NULL, peso NOT NULL, quantidade NOT NULL);
/
CREATE TABLE tb_utensilio of tp_utensilio(id PRIMARY KEY, valor NOT NULL);
/
CREATE TABLE tb_convidado of tp_convidado(nome PRIMARY KEY, idade NOT NULL);
/
CREATE TABLE tb_fornece of tp_fornece(id_ult NOT NULL, id_ali NOT NULL);
/
--Povoamento

--Cliente

INSERT INTO tb_cliente (cpf,nome,endereco,fones,datanasc,sexo)VALUES('123456789-45', 'José Fonte', sys.XMLType.createXML('<endereco><rua>Rua da saudade</rua><numero>82</numero><complemento>complemento</complemento><bairro>Bairro</bairro><cidade>Recife</cidade><estado>Pernambuco</estado><pais>Brasil</pais><cep>5678983</cep></endereco>'), varray_fones(tp_fones('32433243'),tp_fones('90756543'), tp_fones('12345678')),TO_DATE('16/12/1996', 'dd/MM/yyyy'),'M');
/
INSERT INTO tb_cliente (cpf,nome,endereco,fones,datanasc,sexo)VALUES('823456789-67', 'Vosa Xonte',sys.XMLType.createXML('<endereco><rua>Rua da misericórdia</rua><numero>32</numero><complemento>complemento2</complemento><bairro>Bairro2</bairro><cidade>Recife</cidade><estado>Pernambuco</estado><pais>Brasil</pais><cep>77778583</cep></endereco>'), varray_fones(tp_fones('72433243'),tp_fones('70756543'), tp_fones('92345678')),TO_DATE('17/05/1992', 'dd/MM/yyyy'),'F');
/
INSERT INTO tb_cliente (cpf,nome,endereco,fones,datanasc,sexo)VALUES('723456789-35', 'Link Zelda',sys.XMLType.createXML ('<endereco><rua>Rua de ogrimmar</rua><numero>666</numero><complemento>complemento4</complemento><bairro>Bairro4</bairro><cidade>Durotar ranch</cidade><estado>Kalimdor</estado><pais>Azeroth</pais><cep>12345678</cep></endereco>'), varray_fones(tp_fones('12433243'),tp_fones('10756543'), tp_fones('99945678')),TO_DATE('17/12/1976', 'dd/MM/yyyy'),'M');
/
INSERT INTO tb_cliente (cpf,nome,endereco,fones,datanasc,sexo)VALUES('777456789-45', 'Wosy Tonpson',sys.XMLType.createXML('<endereco><rua>Rua da saude</rua><numero>22</numero><complemento>complemento4</complemento><bairro>Bairro4</bairro><cidade>Vitoria</cidade><estado>Seatle</estado><pais>Estados Unidos</pais><cep>75678987</cep></endereco>'), varray_fones(tp_fones('55533243'),tp_fones('50756543'), tp_fones('65345678')),TO_DATE('16/12/1986', 'dd/MM/yyyy'),'M');
/



--Staff

INSERT INTO tb_staff (cpf,nome,cpf_cord,funcao,salario,tipo_contrato)VALUES('907556789-71','Diego Souza','879556789-17', varray_funcao(tp_funcao('Garçon'),tp_funcao('Animador'), tp_funcao('Cozinheiro')),1500.00,'friend');
/
INSERT INTO tb_staff (cpf,nome,cpf_cord,funcao,salario,tipo_contrato)VALUES('337556789-71','Siego Douza','789556789-01', varray_funcao(tp_funcao('Faxineiro'),tp_funcao('Animador')),2000.00,'inutil');
/
INSERT INTO tb_staff (cpf,nome,cpf_cord,funcao,salario,tipo_contrato) VALUES('555556789-71','Fiego Pouza','698756789-71', varray_funcao(tp_funcao('Garçon'), tp_funcao('Cozinheiro')),3000.00,'divergent');
/
INSERT INTO tb_staff (cpf,nome,cpf_cord,funcao,salario,tipo_contrato)VALUES('407556789-71','Tiego Touza','444446789-44', varray_funcao( tp_funcao('Cozinheiro')),2500.00,'esforçado');
/
--Alimentos
/
INSERT INTO tb_alimentos VALUES(20, 20.50, 3.45,30 );
/
INSERT INTO tb_alimentos VALUES(10, 10.50, 1.00,50 );
/
INSERT INTO tb_alimentos VALUES(37, 40.10, 2.50,100 );
/
INSERT INTO tb_alimentos VALUES(15, 2.50, 0.45,200 );
/
INSERT INTO tb_alimentos VALUES(90, 80.50, 8.00,10 );
/

--Utensilio

INSERT INTO tb_utensilio VALUES(01, 2.00);
/
INSERT INTO tb_utensilio VALUES(02, 2.00);
/
INSERT INTO tb_utensilio VALUES(03, 5.00);
/
INSERT INTO tb_utensilio VALUES(04, 2.00);
/
INSERT INTO tb_utensilio VALUES(05, 10.00);
/
INSERT INTO tb_utensilio VALUES(06, 3.00);
/

--Convidados 

INSERT INTO tb_convidado VALUES('Lucas Silveira', 5);
/
INSERT INTO tb_convidado VALUES('Pedro Silveira', 10);
/
INSERT INTO tb_convidado VALUES('João da Silva', 9);
/
INSERT INTO tb_convidado VALUES('Olga Farias', 11);
/
INSERT INTO tb_convidado VALUES('Marcela Joana', 7);
/
INSERT INTO tb_convidado VALUES('Lucas Mateus', 5);
/
INSERT INTO tb_convidado VALUES('Mateus Lucas', 8);
/
INSERT INTO tb_convidado VALUES('Pedro Xilveira', 35);
/
INSERT INTO tb_convidado VALUES('Lucas Paes', 40);
/
INSERT INTO tb_convidado VALUES('Edna Silveira', 39);
/
INSERT INTO tb_convidado VALUES('Atur Gomes', 70);
/
INSERT INTO tb_convidado VALUES('Joana Farias', 50);
/
INSERT INTO tb_convidado VALUES('Lucas Farias', 48);
/
