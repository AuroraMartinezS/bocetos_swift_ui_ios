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
            
            PantallaPersonaje()
                .tabItem { Label("Personajes", systemImage: "sparkles.tv") }
            PantallaPlaneta()
                .tabItem { Label("Planetas", systemImage:"mountain.2.circle.fill") }
            perfil_personal()
                .tabItem { Label("Perfil", systemImage: "person.crop.circle.fill") }
            
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
