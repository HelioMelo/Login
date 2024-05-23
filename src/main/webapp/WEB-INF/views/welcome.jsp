<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Minha primeira View</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    
    .hero-section {
        background: url('https://example.com/sport-recife-banner.jpg') no-repeat center center;
        background-size: cover;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: center;
        position: relative;
    }
    .hero-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
    }
    .hero-content {
        position: relative;
        z-index: 1;
    }
    .hero-section h1 {
        font-size: 4rem;
        margin-bottom: 20px;
        animation: fadeInDown 2s;
    }
    .hero-section p {
        font-size: 1.5rem;
        margin-bottom: 30px;
        animation: fadeInUp 2s;
    }
    .btn-custom {
        background-color: #d9534f;
        border-color: #d9534f;
        animation: fadeInUp 2s;
    }
    .btn-custom:hover {
        background-color: #c9302c;
        border-color: #ac2925;
    }
    .login-form {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        animation: fadeInUp 2s;
    }
    .login-form input {
        margin-bottom: 10px;
    }
    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<body>	
	
	<div class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content animate__animated animate__fadeIn">
        <h1>Cadastro de Usuário</h1>
        <p>Faça seu cadastro</p>
        <div class="login-form">
           <form action="/intro-spring/cadastro" method="post">
    <div class="form-group">
        <label for="username">Nome de Usuário:</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Digite seu nome de usuário" required>
    </div>
    <div class="form-group">
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Digite sua senha" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
</form>

        </div>
    </div>
</div>

</body>
</html>