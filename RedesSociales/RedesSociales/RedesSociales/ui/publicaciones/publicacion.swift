//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "String", body: "Lorem iPSUM")

struct PublicacionVista: View {
    
    let publicacion_a_mostrar: Publicacion
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(publicacion_a_mostrar.title)")
        Text("\(publicacion_a_mostrar.body)")
        
        ScrollView{
            VStack{
                //For each para comentarios de la publicacion
            }
        }
    }
}

#Preview {
    PublicacionVista(publicacion_a_mostrar: publicacion_falsa)
}
