# GDI



<h3>Descrição do mundo real</h3>
	No geral, um buffet se trata de uma forma organizada de servir comidas e bebidas para um grande número de pessoas em eventos. O buffet infantil é uma empresa de buffet que oferece comidas,bebidas e serviços,para festas infantis poupando a família de preocupações a respeito de atrações, alimentação, ambiente, etc. 

Objetivos da Aplicação:
	A aplicação possui o objetivo de oferecer a empresa de buffet infantil um modo organizado de gerenciar seus dados relativos aos eventos organizados, clientes, sua estrutura e também finanças. 

    3. Descrição das entidades:

	    3.1 -  Pessoa
	
        A entidade pessoa é representada por todas as “pessoas” que se envolvem no buffet infantil.

	    Atributos:
        Nome (Atributo Composto)
        Endereço (Atributo Composto que se subdivide em Rua, Número, Complemento, Bairro, Cidade, Estado, País, CEP) (Atributo Composto)
        Telefone (Atributo Multivalorado)
        CPF (Atributo identificador)
        Data de nascimento 
        Sexo

        3.2 - Cliente

        Entidade que herda de pessoa e representa os clientes do buffet, ou seja, as pessoas que irão realizar os eventos organizados pela empresa.

        Atributos: 
        Status(Multivalorado) 
        ID dos eventos realizados(Multivalorado)



	    3.3 - Evento

        Entidade que representa o evento que será realizado pelo cliente, organizado pelo buffet e possuirá serviços. Seus atributos são a data, duração, número de convidados, descrição, local/endereço, tipo, serviços contratados, valor e custo do evento.

	    Atributos:
        Data
        Código de identificação (Atributo Identificador)
        Número de convidados 
        Local/endereço (Atributo Composto que se subdivide em Rua, Número, Complemento, Bairro, Cidade, Estado, País, CEP) (Atributo Composto)
        Valor cobrado ao cliente

	
        3.4 - Serviço

        Essa entidade diz respeito às atrações, alimentos e estrutura que serão oferecidos pelo buffet. Seus atributos são tipo, nome e valor.

        Atributos:
        ID (Atributo identificador)
        Staffs (Atributo Multivalorado)
        Alimentos (Atributo Multivalorado)
        Utensílios (Atributo Multivalorado)
	
	    3.5 - Staff
	
        O staff herda a entidade Pessoa e representa todas pessoas responsáveis por prestar serviços no dia do evento, como garçons e cozinheiros.

        Atributos:
        Função ( Atributo Multivalorado)
        Salário
        Tipo de contrato ( Atributo Multivalorado)

	
        3.6 - Alimentos
	
        Corresponde aos alimentos (inclui bebidas) que serão servidos no evento.
	
	    Atributos:
        Peso 
        Quantidade 
        Nome ( Atributo Multivalorado)
        Tipo ( Atributo Multivalorado)
        ID(Atributo identificador)
        Valor

	    3.7 - Utensílio

        Entidade que Corresponde aos utensílios que o buffet dispõe para realizar eventos, como mesas, cadeiras, pratos e talheres, etc.

	    Atributos:
        ID (Atributo identificador)
        Tipo ( Atributo Multivalorado)
        Quantidade
        Valor
	
	    3.8 - Convidado
	
	    Entidade fraca que Corresponde aos convidados pelo cliente
	
	    Atributos:
        Nome (Atributo discriminador)
        Idade

     4. Descrição dos relacionamentos:

        4.1 - Coordenar

        Auto-relacionamento entre staff, um staff pode coordenar outros staff e os staff só podem ser coordenados por um staff

	    Cardinalidade: 1:N

	
        4.2 - Contratar

        relacionamento entre cliente e evento, onde o cliente pode contratar mais de um evento é um evento só pode ser contratado por um cliente
        Cardinalidade: N:1

	    Atributos: 
	    - Data de Admissão

        4.3 - Utilizar

        Relacionamento entre Staff e Utensílios,que diz respeito o que utensilios alguns membros do staff usarão.

        Cardinalidade:N:N

        4.4 - Fornece

        Relacionamento entre servico,alimentos,utensílios.O serviço fornece alimentos e utensílios,enquanto os alimentos e utensílios são fornecidos por um serviço.

        Cardinalidade:1:N:N


	    4.5 - Invitar

        Relacionamento entre cliente e convidados,o Cliente Invita convidados para o evento e os convidados são invitados por um cliente.

        Cardinalidade : 1:N

        4.6 - Alocar

        O staff pode ser alocado quando o evento presta serviço,e quando um staff e alocado o evento presta um serviço.

        Cardinalidade : 1:N

        4.7 - Prestar

        Um evento vai prestar um serviço,e o serviço só é prestado por evento.

        Cardinalidade : 1:1

    5. Possíveis Perguntas: 

        Quem contratou o buffet?
        Existem alimentos e/ou utensílios suficientes?
        Quando o evento ocorrerá?
        Qual o custo médio de um evento para x pessoas?
        Qual foi o preço do Evento?

    6. Possíveis Relatórios:
        Relatório de eventos (passados e futuros).
        Relatório do estoque (Alimentos + Utensílios).
        Relatório dos clientes.
        Relatório de Admissão de novos funcionários.

