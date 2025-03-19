//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var mostrar_agregar_pantalla: Bool = false;
    
    var body: some View {
        
        if !mostrar_agregar_pantalla{
            ScrollView{
                VStack {
                        ForEach(controlador.series_registradas){
                            _ in Image(systemName: "plus")
                        }
                }
                .padding()
            }
            
            Button("¡Agregar!"){
                mostrar_agregar_pantalla = true

            }
            
        }else{
            AgregarSerie()
            
        }
        

    }
}

#Preview {
    ContentView().environment(VistaModeloBasico())
}
