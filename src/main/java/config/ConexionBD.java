package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ConexionBD {
    // URL de la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/carritoCompras";
    private static final String USER = "root";  // Usuario de la base de datos
    private static final String PASS = "12345";  // Contraseña del usuario de la base de datos

    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() {
        Connection conectar = null;

        try {
            // Registramos el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establecemos la conexión con la base de datos
            conectar = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            // Mostramos el error si la conexión falla
            JOptionPane.showMessageDialog(null, "Error de conexión a la base de datos: " + e.getMessage());
        }

        return conectar;
    }

    // Método para probar la conexión a la base de datos
    public static void probarConexion() {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Conexión exitosa a la base de datos.");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (SQLException e) {
            System.err.println("Error al conectar con la base de datos: " + e.getMessage());
        }
    }

    // Método main para probar la conexión desde la consola
    public static void main(String[] args) {
        probarConexion();
    }
}
