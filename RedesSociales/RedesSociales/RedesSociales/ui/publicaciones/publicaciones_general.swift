//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View{
    
    //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){publicacion in
                        NavigationLink{
                            Text("Hola Mundo")
                        } label : {
                            
                            VStack{
                                Text("\(publicacion.id)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("\(publicacion.title)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.indigo)
                                Text("\(publicacion.body)")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(20)
                            .background(.orange)
                            .onTapGesture {
                                //controlador.mostrar_publicacion(publicacion.id)
                                print("Usted ha seleccionado: \(publicacion.id)")
                            }
                            
                        }
                        
                    }
                }
            }
        }
        .onAppear{
                print("hola mundo")
                        
        }
        .padding(5)
    }
        
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
