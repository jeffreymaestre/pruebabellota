package com.bellota.jeffrey.service;

import com.bellota.jeffrey.entity.Inventario;
import com.bellota.jeffrey.repository.InventarioDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventarioService {
    private final InventarioDao inventarioDao;

    @Autowired
    public InventarioService(InventarioDao inventarioDao) {
        this.inventarioDao = inventarioDao;
    }

    public Inventario guardarInventario(Inventario inventario) {
        return inventarioDao.save(inventario);
    }

    public List<Inventario> obtenerInventarios() {
        return (List<Inventario>) inventarioDao.findAll();
    }

    public double calcularCostoMedio(String codigoProducto, int cantidadCompra, String instalacion, double precioCompra) {
        List<Inventario> inventarios = inventarioDao.findByProductoAndInstalacion(codigoProducto, instalacion);

        double inventarioValorado = 0;
        int inventarioFinal = cantidadCompra;

        for (Inventario inventario : inventarios) {
            inventarioValorado += inventario.getInventario() * inventario.getCostoUnitario();
            inventarioFinal += inventario.getInventario();
        }

        double costoEntrada = cantidadCompra * precioCompra;
        double costoFinal = costoEntrada + inventarioValorado;
        double costoMedio = costoFinal / inventarioFinal;

        return Math.round(costoMedio * 1000) / 1000.0;
    }

}
