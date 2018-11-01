### Criando BD
1 - Para adicionar o bd no oracle database express:

- Execute o "Conceitos B�sicos do Oracle Database 11g Express Edition" via �rea de trabalho ou
painel de controle.
- Crie o banco, nome de usu�rio e senha para o banco, seguindo esse video: https://www.youtube.com/watch?v=3n16GCFT39o

2 - Para fazer a conex�o com o jdbc:

- Menu iniciar -> Executar linhas de comando SQL
- Digite o comandos:
	1. connect system
		digite a senha.
	2. alter user account unlock;
	3. alter user gdi indentified by gdi;
	4. connect gdi/gdi 
       obs: utilizei "gdi" como usu�rio e senha criados no passo 1.
- Agora basta seguir os c�digos do projeto java.


### Camadas

dao - Data access objects, realizam a conex�o. Classe DataSource realiza a conex�o e fornece para as demais classes DAO.
view - interface com usu�rio 
model - Classes de entidades