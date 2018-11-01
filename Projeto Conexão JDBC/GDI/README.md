### Criando BD
1 - Para adicionar o bd no oracle database express:

- Execute o "Conceitos Básicos do Oracle Database 11g Express Edition" via área de trabalho ou
painel de controle.
- Crie o banco, nome de usuário e senha para o banco, seguindo esse video: https://www.youtube.com/watch?v=3n16GCFT39o

2 - Para fazer a conexão com o jdbc:

- Menu iniciar -> Executar linhas de comando SQL
- Digite o comandos:
	1. connect system
		digite a senha.
	2. alter user account unlock;
	3. alter user gdi indentified by gdi;
	4. connect gdi/gdi 
       obs: utilizei "gdi" como usuário e senha criados no passo 1.
- Agora basta seguir os códigos do projeto java.


### Camadas

dao - Data access objects, realizam a conexão. Classe DataSource realiza a conexão e fornece para as demais classes DAO.
view - interface com usuário 
model - Classes de entidades