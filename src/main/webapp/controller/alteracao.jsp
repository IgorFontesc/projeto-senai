<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "model.Vagas" import= "model.ConectandoMySql" import="java.sql.*" %>
      
      
      <%
	
	ConectandoMySql bd = new ConectandoMySql();
	Vagas vg=null;
    int id=0;  
	try{
		
		id = Integer.parseInt(request.getParameter("id"));	
		vg = bd.buscar(id);
	
	}catch(Exception e){}
	
	try{
		
		String gravar= request.getParameter("txtDescricao");
		if(gravar!= null || gravar.equals("")==false);
		
		{
			
			vg.setDescricao(request.getParameter("txtDescricao"));
			vg.setRequisitosobrigatorios(request.getParameter("txtRequisitosObrigatorio"));
			vg.setRequisitosdesejaveis(request.getParameter("txtRequisitosDesejaveis"));
			vg.setRemuneracao(request.getParameter("txtRemuneracao"));
			vg.setBeneficios(request.getParameter("txtBeneficios"));
			vg.setLocaldetrabalho(request.getParameter("txtLocalDeTrabalho"));
			vg.setAberta(request.getParameter("txtAberta"));
			vg.setId(id);
			
			bd.editar(vg);
			response.sendRedirect("../tabela_alteracao_exclusao.jsp");
		}
		
		
	}catch(Exception e){
		
	}

	finally{}
	
%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
    <title>Document</title>
</head>
<body>
    <h1 class="titulo">Sistema de Controle de Vagas de Emprego</h1>
    <h2 class="subTitulo">Altera??o</h2>

    <div class="container">

        <fieldset>
            <form action="alteracao.jsp?id=<%=id%>" method="post" class="formulario">	

             <div class="form">
                <label for="descri??o">Descri??o</label>
                <input type="text" id="descricao" name="txtDescricao"> 
            </div>
        
            <div class="form">
                <label for="requisitos_obrigatorio">Requisitos Obrigat?rios</label>
                <input type="text" id="obrigatorio" name="txtRequisitosObrigatorio">
            </div>

            <div class="form">
                <label for="requisitos_desejaveis">Requisitos desej?veis</label>
                <input type="text" id="desejaveis" name="txtRequisitosDesejaveis">
            </div>

            <div class="form">
                <label for="remuneracao">Remunera??o</label>
                <input class="remuneracao" type="text" id="remuneracao" name="txtRemuneracao">
            </div>
            
             <div class="radio">
                    <label for="Vaga">Vaga</label>
                    <label class="opcao" for="aberta_encerrada">Aberta</label>
                    <input type="radio" value="1" id="aberta" name="txtAberta">
                    <label for="aberta_encerrada">Fechada</label>
                    <input type="radio" value="2" id="aberta" name="txtAberta">
                </div>
			
            <div class="form">
                <label for="beneficios">Benef?cios</label>
                <input type="text" id="beneficios" name="txtBeneficios">
            </div>

            <div class="form">
                <label for="local">Local de Trabalho</label>
                <input type="text" id="local" name="txtLocalDeTrabalho">
            </div>

            <div class="botao">
                <button type="submit">Enviar</button>
            </div>

        </form>
        </fieldset>
        
        <script>

  
			document.getElementsByName("txtDescricao")[0].value="<%=(vg.getDescricao())%>";
			document.getElementsByName("txtRequisitosObrigatorio")[0].value="<%=(vg.getRequisitosobrigatorios())%>";
			document.getElementsByName("txtRequisitosDesejaveis")[0].value="<%=(vg.getRequisitosdesejaveis())%>";
			document.getElementsByName("txtRemuneracao")[0].value="<%=(vg.getRemuneracao())%>";
			document.getElementsByName("txtAberta")[0].value="<%=(vg.getAberta())%>";
			document.getElementsByName("txtBeneficios")[0].value="<%=(vg.getBeneficios())%>";
			document.getElementsByName("txtLocalDeTrabalho")[0].value="<%=(vg.getLocaldetrabalho())%>";

        </script>
        
        
        <div class="botao_tabela">
            <a href="../index.jsp"><button type="button">Voltar</button></a>
        </div>
    </div>
</body>
</html>