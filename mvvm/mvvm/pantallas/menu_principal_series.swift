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
            Text("PELISFLIX")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .foregroundStyle(.indigo)
            Text("Registro de Series")
                .fontWeight(.thin)
                .font(.title3)
            VStack {
                    ForEach(controlador.series_registradas){
                        _ in Image(systemName: "plus")
                    }
            }
            .padding()
        }.padding(20)
                
        Button("¡Agregar!"){
            //controlador.estado_actual_de_aplicacion = .agregando_series
            controlador.cambiar_a_agregar_series()
        }
        .padding(20)
        .background(.indigo)
        .foregroundStyle(.white)
        .clipShape(Capsule())
        
    }
}


#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}
