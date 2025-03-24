//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View{
    
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){publicacion in
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
                }
            }
        }
        .onAppear{
                print("hola mundo")
                if controlador.publicaciones.isEmpty{
                        Task{
                            await controlador.obtener_publicaciones()
                    }
                }
                        
        }
        .padding(5)
    }
        
}

#Preview {
    GeneralPublicaciones()
}
