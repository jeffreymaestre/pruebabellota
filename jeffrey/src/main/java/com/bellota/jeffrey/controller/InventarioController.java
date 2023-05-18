package com.bellota.jeffrey.controller;

import com.bellota.jeffrey.entity.Inventario;
import com.bellota.jeffrey.service.InventarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class InventarioController {
    private final InventarioService inventarioService;

    @Autowired
    public InventarioController(InventarioService inventarioService) {
        this.inventarioService = inventarioService;
    }

    @PostMapping("/crear")
    public ResponseEntity<Inventario> guardarInventario(@RequestBody Inventario inventario) {
        Inventario nuevoInventario = inventarioService.guardarInventario(inventario);
        return new ResponseEntity<>(nuevoInventario, HttpStatus.CREATED);
    }

    @GetMapping("index")
    public ResponseEntity<List<Inventario>> obtenerInventarios() {
        List<Inventario> inventarios = inventarioService.obtenerInventarios();
        return new ResponseEntity<>(inventarios, HttpStatus.OK);
    }

    @GetMapping("/costo-medio/{codigoProducto}/{cantidadCompra}/{instalacion}/{precioCompra}")
    public ResponseEntity<Double> calcularCostoMedio(
            @PathVariable String codigoProducto,
            @PathVariable int cantidadCompra,
            @PathVariable String instalacion,
            @PathVariable double precioCompra) {
        double costoMedio = inventarioService.calcularCostoMedio(codigoProducto, cantidadCompra, instalacion, precioCompra);
        return new ResponseEntity<>(costoMedio, HttpStatus.OK);
    }
}

