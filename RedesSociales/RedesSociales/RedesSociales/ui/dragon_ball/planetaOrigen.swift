//
//  planeta.swift
//  RedesSociales
//
//  Created by alumno on 4/9/25.
//

import SwiftUI

struct planetaOrigen: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ScrollView{
            VStack(){
                
                Text("\(controlador.personajemonoChino?.originPlanet?.name ?? "Planeta de origen")" )
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(10)
                    .foregroundStyle(Color.teal)
                
                AsyncImage(url: URL(string:controlador.personajemonoChino?.originPlanet?.image ?? "Imagen"))
                { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.teal, lineWidth: 5)
                            )
                }.frame(width: 250, height: 250)
                .padding(20)
                
                Text("\(controlador.personajemonoChino?.originPlanet?.description ?? "Descripción")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color("newPrimaryColor"))
                    .padding(20)
                    .lineSpacing(8)
                
            }.padding(15)
        }.background(Color("colorplanet"))
    }
}

#Preview {
        planetaOrigen().environment(ControladorAplicacion())
    
}
