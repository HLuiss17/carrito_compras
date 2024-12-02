package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import config.ConexionBD;

public class ProductoDAO {

    // Método para listar los productos
    public List<Productos> obtenerProductos() throws SQLException {
        List<Productos> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";  // La consulta sigue siendo la misma, ya que idCategoria es un campo en la tabla

        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Long idProducto = rs.getLong("idProductos");
                String nombre = rs.getString("nombre");
                Long idCategoria = rs.getLong("idCategoria");  // Ahora obtenemos idCategoria
                double precio = rs.getDouble("precio");

                // Creamos el objeto Producto y lo añadimos a la lista
                productos.add(new Productos(idProducto, nombre, idCategoria, precio));
            }

        } catch (SQLException e) {
            throw new SQLException("Error al obtener los productos: " + e.getMessage());
        }

        return productos;
    }

}
