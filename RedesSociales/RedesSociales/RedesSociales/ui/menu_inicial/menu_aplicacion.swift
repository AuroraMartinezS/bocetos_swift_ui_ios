//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import  SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            GeneralPublicaciones()
                .tabItem { Label("Mensajes", systemImage: "envelope.fill") }
                .badge(controlador.publicaciones.count)
            
            Text("Hola Mundis")
                .tabItem { Label("Dragon Ball API", systemImage: "person.crop.circle.fill") }
            Text("Hola desde pantalla3")
                .tabItem { Label("Etiqueta de este label", systemImage: "circle") }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
