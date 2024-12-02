package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Productos;
import service.LoginService;
import service.LoginServiceSessionImplement;
import service.ProductoService;
import service.ProductoServiceImplement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Crear instancia del servicio de productos
        ProductoService productoService = new ProductoServiceImplement();

        // Obtener lista de productos desde la base de datos
        List<Productos> productos = productoService.listar();

        // Obtener el nombre de usuario si está autenticado
        LoginService auth = new LoginServiceSessionImplement();
        Optional<String> usernameOptional = auth.getUsername(req);

        // Configurar la respuesta como HTML
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            // Crear plantilla HTML
            out.print("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"utf-8\">");
            out.println("<title>Listado de Productos</title>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Listado de productos</h1>");

            // Mostrar saludo si el usuario está autenticado
            if (usernameOptional.isPresent()) {
                out.println("<div style='color:blue;'> Hola " + usernameOptional.get() + ", Bienvenido</div>");
            }

            // Crear contenedor para los productos
            out.println("<div class=\"container mt-5\">");
            out.println("<div class=\"row\">");

            // Iterar sobre los productos y mostrarlos
            for (Productos pr : productos) {
                out.println("<div class=\"col-md-4 mb-4\">"); // Columna para una tarjeta
                out.println("<div class=\"card h-100\">"); // Tarjeta
                out.println("<div class=\"card-body\">");
                out.println("<h5 class=\"card-title\">ID: " + pr.getIdProducto() + "</h5>");
                out.println("<h6 class=\"card-subtitle mb-2 text-muted\">" + pr.getNombre() + "</h6>");
                out.println("<p class=\"card-text\">Categoría: " + pr.getIdCategoria() + "</p>");

                // Mostrar precio y botón solo si el usuario está autenticado
                if (usernameOptional.isPresent()) {
                    out.println("<p class=\"card-text\">Precio: $" + pr.getPrecio() + "</p>");
                    out.println("<a href=\""
                            + req.getContextPath()
                            + "/agregar-carro?idProducto=" + pr.getIdProducto()
                            + "\" class=\"btn btn-success\">Agregar al Carrito</a>");
                }

                out.println("</div>"); // Fin del cuerpo de la tarjeta
                out.println("</div>"); // Fin de la tarjeta
                out.println("</div>"); // Fin de la columna
            }

            out.println("</div>"); // Fin de la fila de productos
            out.println("</div>"); // Fin del contenedor
            out.println("</body>");
            out.println("</html>");
        }
    }
}
