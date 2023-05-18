package com.bellota.jeffrey.repository;

import com.bellota.jeffrey.entity.Inventario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InventarioDao extends CrudRepository<Inventario, Long> {
    //List<Inventario> findByProductoAndInstalacion(String codigoProducto, String instalacion);

    @Query("SELECT i FROM Inventario i WHERE i.codigo = :codigoProducto AND i.instalacion = :instalacion")
    List<Inventario> findByProductoAndInstalacion(@Param("codigoProducto") String codigoProducto, @Param("instalacion") String instalacion);
}
