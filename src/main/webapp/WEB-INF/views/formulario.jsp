<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro de Torcedores</title>
<spring:url var="cssBootstrap" value="/static/bootstrap.min.css" />
<spring:url var="cssAnimate" value="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link type="text/css" rel="stylesheet" href="${cssBootstrap}" />
<link type="text/css" rel="stylesheet" href="${cssAnimate}" />
<style>
    body {
        background-color: #f8f9fa;
    }
    
    .custom-fieldset {
        background-color: #ffffff;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .lead {
        background-color: #ffffff;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .carousel-item img {
        width: 100%;
        height: 50vh; /* Adjust the height as needed */
        object-fit: cover;
    }
    footer {
        background-color: #343a40;
        color: #ffffff;
        padding: 10px 0;
        text-align: center;
        position: relative;
        width: 100%;
        margin-top: 40px; /* Add spacing above the footer */
    }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light animate__animated animate__fadeInDown">
  <a class="navbar-brand" href="index.jsp">Cadastro de Torcedores</a> <!-- Link to the home page -->
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contato</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Carousel -->
<div id="torcedorCarousel" class="carousel slide animate__animated animate__fadeIn" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://www.designi.com.br/images/preview/10189009.jpg" class="d-block w-100" alt="Image 1">
    </div>
    <div class="carousel-item">
      <img src="https://www.visualimpressao.com.br/wp-content/uploads/2021/04/DISTIME03.jpg" class="d-block w-100" alt="Image 2">
    </div>
  </div>
  <a class="carousel-control-prev" href="#torcedorCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#torcedorCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="container mt-5">

    <h3 class="lead text-center animate__animated animate__fadeIn">${frase}</h3>
    
    <fieldset class="custom-fieldset animate__animated animate__fadeInUp">
        <form:form method="POST" modelAttribute="torcedor">
            <div class="form-group">
                <label>Nome:</label>
                <form:input path="nome" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Time:</label>
                <form:input path="time" class="form-control"/>
            </div>
            <form:button class="btn btn-primary btn-block">Enviar</form:button>
        </form:form>
    </fieldset>

    <c:if test="${not empty torcedores}">
        <fieldset class="custom-fieldset animate__animated animate__fadeInUp">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>NOME</th>
                        <th>TIME</th>
                        <th>AÇÕES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="torcedor" items="${torcedores}">
                        <tr class="animate__animated animate__fadeInUp">
                            <td>${torcedor.nome}</td>
                            <td>${torcedor.time}</td>
                            <td>
                                <a class="btn btn-warning btn-sm" href="editar/${torcedor.id}">Editar</a>
                                <a class="btn btn-danger btn-sm" href="excluir/${torcedor.id}">Excluir</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </fieldset>
    </c:if>
</div>

<footer class="animate__animated animate__fadeInUp">
    <p>&copy; 2024 Cadastro de Torcedores. Todos os direitos reservados.</p>
</footer>

</body>
</html>
