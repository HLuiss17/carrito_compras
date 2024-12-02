package service;

import models.ProductoDAO;
import models.Productos;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import config.ConexionBD;

public class ProductoServiceImplement implements ProductoService{
    private ProductoDAO productoDAO;

    public ProductoServiceImplement() {
        // Inicializa el DAO (puedes inyectarlo a través de un constructor si es necesario)
        this.productoDAO = new ProductoDAO();
    }

    @Override
    public List<Productos> listar() {
        try {
            // Utilizamos el DAO para obtener los productos desde la base de datos
            return productoDAO.obtenerProductos();
        } catch (SQLException e) {
            e.printStackTrace();  // O manejar la excepción de alguna otra forma
            return null;
        }
    }

    @Override
    public Optional<Productos> agregarPorId(Long idProducto) {
        return listar().stream().filter(p -> p.getIdProducto().equals(idProducto)).findAny();
    }
}
