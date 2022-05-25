<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "model.ConectandoMySql" import = "java.sql.* " %>
    
    
    <%	
    
	 	ConectandoMySql bd = new ConectandoMySql();
    	Connection conexao = bd.conectarBd();
    	String Sql = "select * from tblVagas";
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
    <h1 class="titulo">Lista de vagas de emprego</h1>
    <h2 class="subTitulo">Alteração/Exclusão</h2>

    <div class="tabela">
        <fieldset>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Descrição</th>
                    <th scope="col">Req. Obrigatórios</th>
                    <th scope="col">Req. Desejáveis</th>
                    <th scope="col">Remuneração</th>
                    <th scope="col">Benefícios</th>
                    <th scope="col">Local de Trabalho</th>
                    <th scope="col">Alteração</th>
                    <th scope="col">Excluir</th>
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
            		<td><a href="controller/alteracao.jsp?id=<%=rs.getInt("idVagas") %>">Editar</a></td>
            		<td><a href="controller/excluirVaga.jsp?id=<%=rs.getInt("idVagas") %>">Excluir</a></td>
            	</tr>
          	
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