//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie : View {
    @Environment(VistaModeloBasico.self) private var controlador
   
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_serie: String = ""
    @State var fecha: Int = 0;
    @State var fecha_estreno: Int = 0;
    @State var plataformas: [Plataforma] = [Plataforma(nombre: "Hulu", icono: "icono plus")]
    
    @State var indicar_problemas: Bool = false;
    
    
    var body: some View {
        Text("Hola mundo")
        TextField("Nombre", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie, no tiene su nombre")
        }
        
        TextField("Tipo", text: $tipo_de_serie)
        
        Spacer()
        ScrollView{
            HStack{
                ForEach(plataformas){plataforma in Text(plataforma.nombre)
                    
                }
            }
        }
        

        
        
        Button("Agregar Plataforma"){
            print("Agrear una plataforma falta de implementar")
        }
        
        Button("Agregar Serie"){
            print("agregando series")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_serie, plataformas : plataformas, fecha_estreno: 2004, sinopsis: "sf", caratula: "d")
            
            indicar_problemas = controlador.agregar_serie(serie_nueva)
        }
        
    }
}

/*
 
 var nombre: String
 var tipo: String
 var fecha_estreno: Int
 var sinopsis: String
 var temporadas: [Temporada] = []
 var caratula: String
 var plataformas: [Plataforma] = []
 
 
 
 
 
 
 
 */


#Preview {
    AgregarSerie().environment(VistaModeloBasico())
}
