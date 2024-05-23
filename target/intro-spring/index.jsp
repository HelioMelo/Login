<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    .hero-section {
        background: url('https://static7.depositphotos.com/1004841/738/i/450/depositphotos_7381892-stock-photo-flag-of-brazil.jpg') no-repeat center center;
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
</head>
<body>

<div class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content animate__animated animate__fadeIn">
        <h1>Brasil</h1>
        <p>Cadastro de Times brasileiro</p>
        <p>Login</p>
        <div class="login-form">
            <!-- Exibir mensagem de erro -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
            </c:if>
            <form action="login" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Nome de Usuário" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Senha" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
                <a href="/intro-spring/login" class="btn btn-primary btn-block">Cadastrar</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
