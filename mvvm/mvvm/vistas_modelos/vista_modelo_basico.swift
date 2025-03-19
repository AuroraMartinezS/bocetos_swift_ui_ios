//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable

class VistaModeloBasico{
    var estado_actual_de_aplicacion: EstadosDeLaAplicaion = .mostrando_series
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool{
        
        if let serie_nueva = serie{
            if serie_nueva.nombre == ""{
                return false;
            }
                series_registradas.append(serie_nueva)
        }
        else{
            
            //print("Hola Mundo Desde El Controlador")
            series_registradas.append(InformacionSerie(nombre: "Prueba", tipo: "Prueba", fecha_estreno: 2018, sinopsis: "sinopsis larga", caratula: "linkImagen"))
        }
        
        return true;
    }
}
