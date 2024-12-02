<%@ page import="models.Productos" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Productos</title>
</head>
<body>
<h1>Listado de Productos</h1>
<%
    String username = (String) request.getAttribute("username");
    List<models.Productos> productos = (List<Productos>) request.getAttribute("productos");
%>
<c:if test="${not empty username}">
    <div style="color:blue;">Hola <%= username %> Bienvenido</div>
</c:if>
<table>
    <tr>
        <th>ID PRODUCTO</th>
        <th>NOMBRE</th>
        <th>CATEGORÍA</th>
        <c:if test="${not empty username}">
            <th>PRECIO</th>
            <th>AGREGAR</th>
        </c:if>
    </tr>
    <% for (models.Productos pr : productos) { %>
    <tr>
        <td><%= pr.getIdProducto() %></td>
        <td><%= pr.getNombre() %></td>
        <td><%= pr.getIdCategoria() %></td>
        <c:if test="${not empty username}">
            <td><%= pr.getPrecio() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/agregar-carro?idProducto=<%= pr.getIdProducto() %>">Agregar carro</a>
            </td>
        </c:if>
    </tr>
    <% } %>
</table>
</body>
</html>
