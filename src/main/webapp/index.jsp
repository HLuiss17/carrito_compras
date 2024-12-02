<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Optional" %>
<%@ page import="service.LoginService" %>
<%@ page import="service.LoginServiceSessionImplement" %>

<%
    // Servicio de autenticación
    LoginService auth = new LoginServiceSessionImplement();
    Optional<String> usernameOptional = auth.getUsername(request); // Obtiene el nombre del usuario autenticado
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manejo de Sesiones</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" type="text/css" href="styles/index.css">
</head>
<body>
<!-- Inicio del encabezado -->
<section>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Carrito de compras</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarEnlace" aria-controls="navbarEnlace" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarEnlace">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"><i class="bi bi-house-door-fill"></i> Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <i class="bi bi-cart-fill"></i>(<span>0</span>) Carrito</a>
                    </li>
                </ul>
                <form class="d-flex" id="buscarProductos">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
                <!-- Iniciar sesión o mostrar usuario autenticado -->
                <ul class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">

                        <%
                            if (usernameOptional.isPresent()) {
                                out.print("<i class=\"bi bi-person-badge\"></i>"+usernameOptional.get()+"");
                            } else {
                                out.print("<i class=\"bi bi-person-badge\"></i> Iniciar Sesion");
                            }
                        %>
                    </a>
                    <% if (usernameOptional.isPresent()) { %>
                    <!-- Dropdown para usuario autenticado -->
                    <ul class="dropdown-menu">
                        <li class="text-center">
                            <img src="img/user.png" alt="Usuario"><br>
                        </li>
                        <li class="text-center">
                            <a class="dropdown-item" href="/carro_compras1/logout"><i class="bi bi-box-arrow-left"></i> Salir</a>
                        </li>
                    </ul>
                    <% } else { %>
                    <!-- Dropdown para usuarios no autenticados -->
                    <ul class="dropdown-menu">
                        <li class="text-center">
                            <img src="img/user.png" alt="Usuario"><br>
                        </li>
                        <li class="text-center">
                            <a class="dropdown-item" href="/carro_compras1/login.html" data-bs-toggle="modal" data-bs-target="#loginModal">Iniciar Sesión</a>
                        </li>
                    </ul>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
</section>

<!-- Modal de inicio de sesión -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="modal-content">
            <div class="modal-header d-flex justify-content-center w-100">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="imgInicioSesion d-flex justify-content-center">
                <img src="img/userIniciarSesion.png" class="img-fluid">
            </div>
            <div class="modal-body d-flex justify-content-center" id="LoginModalDatos">
                <!-- El contenido del login se cargará aquí -->
            </div>
        </div>
    </div>
</div>

<!-- Cuerpo principal -->
<section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12" id="LoginRegistro">
                <!-- Contenido adicional aquí -->
            </div>
        </div>
    </div>
</section>

<!-- Pie de página -->
<section>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <p class="fotter">&copy; 2024 Mi Sitio Web. Todos los derechos reservados.</p>
                <p class="fotter">
                    <a href="https://www.facebook.com" class="text-white me-3" target="_blank"><i class="bi bi-facebook"></i> Facebook</a>
                    <a href="https://www.twitter.com" class="text-white me-3" target="_blank"><i class="bi bi-twitter"></i> Twitter</a>
                    <a href="https://www.instagram.com" class="text-white" target="_blank"><i class="bi bi-instagram"></i> Instagram</a>
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="js/CargarLoginModalAjax.js"></script>
</body>
</html>
