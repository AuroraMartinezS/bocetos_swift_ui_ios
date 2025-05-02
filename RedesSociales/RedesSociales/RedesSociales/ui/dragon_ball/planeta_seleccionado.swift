//
//  planeta_seleccionado.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI

struct PlanetaSeleccionado: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        //NavigationStack{
        ScrollView{
            VStack(){
                
                Text("\(controlador.planetaplanetita?.name ?? "Nombre personaje")" )
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(10)
                    .foregroundStyle(Color.green)
                
                AsyncImage(url: URL(string:controlador.planetaplanetita?.image ?? "Imagen"))
                { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(.green, lineWidth: 2))
                }.frame(width: .infinity)
                    .padding(10)
                    .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                    
                if(controlador.planetaplanetita?.isDestroyed == true){
                    Text("Estado: Destruido")
                        .padding(10)
                        .foregroundStyle(Color.white)
                        .background(Color("rojoClaro"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                }else{
                    Text("Estado: Estable")
                        .padding(10)
                        .foregroundStyle(Color("verdeOscuro"))
                        .background(Color("BlancoTenue"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                }
                Text("\(controlador.planetaplanetita?.description ?? "Descripción")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color("verdeOscuro"))
                    .padding(20)
                    .lineSpacing(8)
                
                
            }.padding(15)
        }.background(Color("verdeClaro"))
        
        //}
            
    }
}

#Preview {
    NavigationStack{
        PlanetaSeleccionado()
            .environment(ControladorAplicacion())
        
    }
    
}

