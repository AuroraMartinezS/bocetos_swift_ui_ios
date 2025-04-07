//
//  personaje.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct Personaje: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        ScrollView{
            VStack(){
                
                Text("\(controlador.personaje_seleccionado?.name ?? "Nombre personaje")" )
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(10)
                    .foregroundStyle(Color.teal)
                
                AsyncImage(url: URL(string:controlador.personaje_seleccionado?.image ?? "Imagen"))
                { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }.frame(width: 100, height: 100)
                    .padding(100)
                    .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                
                Text("Planeta de origen: \(controlador.personaje_seleccionado?.originPlanet?.name ?? "Planeta de origen")")
                    .italic()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color.teal)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                
                Text("\(controlador.personaje_seleccionado?.description ?? "Descripción")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color("newPrimaryColor"))
                    .padding(20)
                    .lineSpacing(8)
                
                AsyncImage(url: URL(string:controlador.personaje_seleccionado?.originPlanet?.image ?? "Imagen"))
                { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }.frame(width: 100, height: 100)
                    .padding(20)
            }.padding(15)
        }
    }
}

#Preview {
    NavigationStack{
        Personaje()
            .environment(ControladorAplicacion())
        
    }
    
}

