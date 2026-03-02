<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Carro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</head>
<c:if test="${not empty saida}">
    <div class="alert alert-success">${saida}</div>
</c:if>

<c:if test="${not empty erro}">
    <div class="alert alert-danger">${erro}</div>
</c:if>

<c:if test="${not empty listaCarros}">
	<p>DEBUG: ${listaCarros}</p>
    <table class="table table-striped mt-4">
        <thead class="table-dark">
            <tr>
                <th>Placa</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Ano</th>
                <th>Cor</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${listaCarros}">
                <tr>
                    <td>${c.placa}</td>
                    <td>${c.marca}</td>
                    <td>${c.modelo}</td>
                    <td>${c.ano}</td>
                    <td>${c.cor}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
<body>
	<br/>
	<div class="conteiner" align="center">
	
		<h2>Cadastro de Carro</h2>
		<br />
		<form action="carro" method="post">
			<table>
				<tr style="border-bottom: solid white 12px">
					<td colspan="3" > 
						<input type="text" name="placa" id ="placa" placeholder="Placa" value='<c:out value="${carro.placa}"/>'>				
					</td>
				</tr>
				<tr style="border-bottom: solid white 12px;">
					<td colspan= "4">
						<input type="text" name="marca" id="marca" placeholder="Marca" value='<c:out value="${carro.marca }"/>'>
					</td>
				</tr>
				<tr style="border-bottom: solid white 12px;"><!-- linha -->
					<td colspan= "4">
						<input type="text" name="modelo" id="modelo" placeholder="Modelo" value='<c:out value="${carro.modelo }"/>'>
					</td>
				</tr>
				<tr style="border-bottom: solid white 12px;"><!-- linha -->
					<td colspan= "4">
						<input type="number" name="ano" id="ano" placeholder="#ANO" value='<c:out value="${carro.ano }"/>'>
					</td>
				</tr>
				<tr style="border-bottom: solid white 12px;"><!-- linha -->
					<td colspan= "4">
						<input type="text" name="cor" id="cor" placeholder="Cor" value='<c:out value="${carro.cor }"/>'>
					</td>
				</tr>	
				<tr style="border-bottom: solid white 12px;"><!-- linha -->
					<td><input type="submit" id="botao" name= "botao" value="Inserir" class="btn btn-primary btn-lg w-100" ></td>
				</tr>
				<tr style="border-bottom: solid white 12px;"><!-- linha -->
					<td><input type="submit" id="botao" name= "botao" value="Listar" class="btn btn-primary btn-lg w-100" ></td>
				</tr>
			</table>
		</form>
	</div>
	<br />
</body>
</html>