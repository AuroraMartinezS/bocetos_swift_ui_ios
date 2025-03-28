//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "XDSDFRE")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Aurora")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "asdasdo@gmail.com")")
    }
}

#Preview{
    PerfilBasicoVista().environment(ControladorAplicacion())
}
