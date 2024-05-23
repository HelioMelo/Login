<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Minha primeira página</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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
    .form-container {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        animation: fadeInUp 2s;
    }
    .form-container input {
        margin-bottom: 10px;
    }
    .form-title {
        font-size: 1.2rem;
        font-weight: bold;
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
        <h1>Sport Recife</h1>
        <p>O verdadeiro campeão brasileiro de 1987</p>
        <a href="formulario" class="btn btn-custom btn-lg mb-4">Visualizar Torcedores</a>
        <!-- Login Form -->
        <div class="form-container">
            <h2 class="form-title">Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Usuário" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Senha" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
        <!-- Registration Form -->
        <div class="form-container">
            <h2 class="form-title">Cadastro</h2>
            <form action="cadastro" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Usuário" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="E-mail" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Senha" required>
                </div>
                <button type="submit" class="btn btn-success btn-block">Cadastrar</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
