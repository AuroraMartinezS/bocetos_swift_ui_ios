//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

//let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "String", body: "Lorem iPSUM")

struct PublicacionVista: View {

    @Environment(ControladorAplicacion.self) var controlador
        
    var body: some View {
        
        VStack(){
            VStack(){
                Text("\(controlador.publicacion_seleccionada?.title ?? "Titulo")" )
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.indigo)
                    .font(.system(size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(controlador.publicacion_seleccionada?.body ?? "Descripcion")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color("newPrimaryColor"))
                    .padding(10)
                
                NavigationLink{
                    PerfilBasicoVista()
                }label: {
                    Text("Ver perfil")
                        .foregroundStyle(Color.teal)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .background(Color("newSecondaryColor"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                }.simultaneousGesture(TapGesture().onEnded({
                    controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
                }))
            }
            .padding(10)
            .background(Color("secundaryBackgroundColor"))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            ScrollView{
                VStack{
                    ForEach(controlador.comentarios){ comentario in
                        
                        VStack{
                            Text("\(comentario.name)")
                                .italic()
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("\(comentario.body)")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                        .background(Color.white)
                        
                    }
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }.padding(20)
                    .background(Color("backgroundColor"))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            }
        }.padding(20)
    }
}


#Preview {
    NavigationStack{
       
        PublicacionVista()
            .environment(ControladorAplicacion())
        
    }
    
}
