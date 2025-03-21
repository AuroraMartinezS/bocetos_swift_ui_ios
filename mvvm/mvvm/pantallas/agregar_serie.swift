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
    @State var plataformas_agregadas: [Plataforma] = []
    
    @State var imagen_plataforma: String = "";
    @State var nombre_plataforma: String = "";
    
    
    @State var indicar_problemas: Bool = false;
    @State var mostrar_agregar_plataformas: Bool = false;
    
    
    
    var body: some View {
        Text("PELISFLIX")
        TextField("Nombre", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie, no tiene su nombre")
        }
        
        TextField("Tipo", text: $tipo_de_serie)
        
        Spacer()
        Text("Plataformas")
        
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_agregadas){plataforma in Text(plataforma.nombre)
                    
                }
            }
        }
        .sheet(isPresented: $mostrar_agregar_plataformas){
            Text("Por favor agerga una plataforma")
            
            TextField("Nombre de la plataforma", text: $nombre_plataforma)
            TextField("Indica la imagen", text: $imagen_plataforma)
            
            ScrollView{
                VStack{
                    ForEach(plataformas) { plataforma in
                        /*@START_MENU_TOKEN@*/Text(plataforma.nombre)/*@END_MENU_TOKEN@*/.onTapGesture {
                            //
                        }
                    }
                }
            }
            
            Button("Aregar plataforma"){
                if !nombre_plataforma.isEmpty && !imagen_plataforma.isEmpty{
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
                    
                    plataformas_agregadas.append(plataforma_nueva)
                
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                }
            }
        }.presentationDetents([.medium, .large])

        Spacer()
        
        Button("Agregar Plataforma"){
            mostrar_agregar_plataformas = true
        }
        
        Spacer()
        
        Button("Agregar Serie"){
           // print("agregando series")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_serie, plataformas: plataformas, fecha_estreno: 2004, sinopsis: "sf", caratula: "d")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
            //ARREGLAR, NO FUNCIONA.
                
            
        }
        
    }
}



#Preview {
    AgregarSerie().environment(VistaModeloBasico())
}
