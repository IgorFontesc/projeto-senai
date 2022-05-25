<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "model.ConectandoMySql" import= "model.Vagas"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	
	<%

			int id = 0;	
			try{
				id = Integer.parseInt(request.getParameter("id"));
				Vagas bd=new Vagas();
				bd.excluirVaga(id);				
			}catch(Exception e)
			{		}

				
			response.sendRedirect("../tabela_alteracao_exclusao.jsp");

%>
	
	
</body>
</html>