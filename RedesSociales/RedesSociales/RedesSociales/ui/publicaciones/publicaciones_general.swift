//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View{
    
    //@StateObject var controlador = ControladorPublicaciones()
    let esquinas_redondeadas = CGSize(width: 15, height: 15)
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Text("Tus Mensajes")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundStyle(.teal)
                VStack{
                    ForEach(controlador.publicaciones){publicacion in
                        NavigationLink{
                            PublicacionVista()
                        } label : {
                            
                            VStack{
                                HStack(){
                                    Text("#\(publicacion.id)")
                                        .fontWeight(.bold)
                                        .foregroundStyle(.teal)
                                        .padding(15)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.teal, lineWidth: 2)
                                        )
                                        
                                    Text("\(publicacion.title)")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundStyle(Color("newSecondaryColor"))
                                        .font(.system(size: 18))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(5)
                                .frame(maxWidth: .infinity)

                                Text("\(publicacion.body)")
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(30)
                            .background(Color("newPrimaryColor"))
                            .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                                    .shadow(color: .black, radius: 3, x: 0, y: 1)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(.teal, lineWidth: 2)
                                        )
                        }
                        .simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
                        
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
