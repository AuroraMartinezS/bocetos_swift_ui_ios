//
//  menu_principal_series.swift
//  mvvm
//
//  Created by alumno on 3/21/25.
//

import SwiftUI

struct MenuPrincipalSeries: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    var body: some View {
        ScrollView{
            VStack {
                    ForEach(controlador.series_registradas){
                        _ in Image(systemName: "plus")
                    }
            }
            .padding()
        }
        
        Spacer()
        
        Button("¡Agregar!"){
            controlador.estado_actual_de_aplicacion = .agregando_series
            controlador.cambiar_a_agregar_series()
        }
    }
}


#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}
