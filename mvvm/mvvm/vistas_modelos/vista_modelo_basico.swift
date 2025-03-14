//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable

class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("Hola Mundo Desde El Controlador")
        series_registradas.append(InformacionSerie(nombre: "Prueba", tipo: "Prueba", fecha_estreno: 2018, sinopsis: "sinopsis larga", caratula: "linkImagen"))
    }
}
