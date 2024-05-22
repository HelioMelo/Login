<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Torcedores</title>
</head>
<body>
	<h3>${frase}</h3>
	<fieldset style="background-color: #96c3c4; border-radius: 8px">
		<form:form method="POST" modelAttribute="torcedor">
			<p>Nome: <form:input path="nome"/></p>
			<p>Time: <form:input path="time"/></p>
			<input type="hidden" name="index" value="${index}" />
			<p><form:button>Enviar</form:button></p>
		</form:form>
	</fieldset>
	
	<br>

	<c:if test="${not empty torcedores}">
		<fieldset style="background-color: #96c3c4; border-radius: 8px">
			<table>
				<thead>
					<th>NOME</th>
					<th>TIME</th>
					<th>AÇÕES</th>
				</thead>
				<tbody>
					<c:forEach var="torcedor" items="${torcedores}">
					<tr>
						<td>${torcedor.nome}</td>
						<td>${torcedor.time}</td>
						<td><a href="editar/${torcedores.indexOf(torcedor)}">Editar</a> | 
						<a href="excluir/${torcedores.indexOf(torcedor)}">Excluir</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</c:if>
</body>
</html>