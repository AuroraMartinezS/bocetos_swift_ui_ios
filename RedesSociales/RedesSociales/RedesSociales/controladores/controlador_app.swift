//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor //esta clase se ejecuta sobre el hilo principal tiene control sobre los otros hilos

public class ControladorAplicacion{
    
    var publicaciones: Array<Publicacion> = []
    var publicacion_seleccionada : Int = -1
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    
    func descargar_publicaciones() async {
        
        defer{
            print("Esta función se mando a llamar después de todos los awaits en mi función \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else{
            return
        }
        publicaciones = publicaciones_descargadas;
        
        
    }
    
    func descargar_comentarios() async {
        
        defer{
            print("Esta función se mando a llamar después de todos los awaits en mi función \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else{
            return
        }
        publicaciones = publicaciones_descargadas;
        
    }
    
}
