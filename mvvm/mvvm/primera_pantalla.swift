//
//  primera_pantalla.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

@main struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup(id: "nombre"){ //Conjunto de pantallas que va a tener la escena.
            ContentView().environment(controlador_basico)
        }
    }
    
}
