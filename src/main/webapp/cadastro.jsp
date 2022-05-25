<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <h1 class="titulo">Sistema de Controle de Vagas de Emprego</h1>
    <h2 class="subTitulo">Inclusão</h2>

<div class="container">
    <fieldset>

        <form action="controller/InserirVaga.jsp" class="formulario">
            
            <div class="form">
                <label for="descrição">Descrição</label>
                <input type="text" id="descricao" name="txtDescricao"> 
            </div>
        
            <div class="form">
                <label for="requisitos_obrigatorio">Requisitos Obrigatórios</label>
                <input type="text" id="obrigatorio" name="txtRequisitosObrigatorio">
            </div>

            <div class="form">
                <label for="requisitos_desejaveis">Requisitos desejáveis</label>
                <input type="text" id="desejaveis" name="txtRequisitosDesejaveis">
            </div>

            <div class="form">
                <label for="remuneracao">Remuneração</label>
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
                <label for="beneficios">Benefícios</label>
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
    <div class="botao_tabela">
        <a href="index.jsp"><button type="button">Voltar</button></a>
    </div>

</div>
</body>
</html>