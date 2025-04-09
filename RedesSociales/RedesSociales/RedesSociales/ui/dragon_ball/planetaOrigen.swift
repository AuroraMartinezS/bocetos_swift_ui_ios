//
//  planeta.swift
//  RedesSociales
//
//  Created by alumno on 4/9/25.
//

import SwiftUI

struct planetaOrigen: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        Text("PlanetaDeOrigen")
    }
}

#Preview {
        planetaOrigen()
            .environment(ControladorAplicacion())
}
