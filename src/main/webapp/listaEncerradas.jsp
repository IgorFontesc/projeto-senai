<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ConectandoMySql" import="model.Vagas" import= "java.sql.*"%>
    
    
    <%	
    
	 	ConectandoMySql bd = new ConectandoMySql();
    	Connection conexao = bd.conectarBd();
    	
    	String Sql = "select * from tblVagas where aberta = 2";
    	Statement st = (Statement) conexao.createStatement();
    	ResultSet rs = ((java.sql.Statement) st).executeQuery(Sql);
    	
    %>
    
    
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <h1 class="titulo">Lista de vagas de emprego encerradas</h1>

    <div class="tabela">
        <fieldset>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Descri��o</th>
                        <th scope="col">Req. Obrigat�rios</th>
                        <th scope="col">Req. Desej�veis</th>
                        <th scope="col">Remunera��o</th>
                        <th scope="col">Benef�cios</th>
                        <th scope="col">Local de Trabalho</th>
                    </tr>
                    </thead>
                    
                 <% while (rs.next())
                	
                
            	{%>
	           <tbody>  
            	<tr>
            		<td><%=rs.getString("idVagas") %> </td>
            		<td><%=rs.getString("descricao") %></td>
            		<td><%=rs.getString("requisitosobrigatorios") %></td>
            		<td><%=rs.getString("requisitosdesejaveis") %></td>
            		<td><%=rs.getString("remuneracao") %></td>
            		<td><%=rs.getString("beneficios") %></td>
            		<td><%=rs.getString("localdetrabalho") %></td>
            	</tr>
          		</tbody>
           		 <%}
            
		            rs.close();
		            conexao.close();
		            st.close();
    	
            	%>  
              
            
            </table>
        </fieldset>
        <div class="botao_tabela">
            <a href="index.jsp"><button type="button">Voltar</button></a>
        </div>
    </div>
</body>
</html>