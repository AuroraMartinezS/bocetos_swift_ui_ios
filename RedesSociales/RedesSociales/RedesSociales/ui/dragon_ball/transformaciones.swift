//
//  transformaciones.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//

import SwiftUI

struct transformacionesPersonaje: View{
    @Environment(ControladorAplicacion.self) var controlador
    var transformaciones: Array<Transformacion> = []
    
    var body: some View{
        
        
        ScrollView{
            VStack(){
                
                Text("Transformaciones")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(10)
                    .foregroundStyle(Color.orange)
                
                
                ForEach(controlador.personajemonoChino?.transformations ?? transformaciones){transformacion in
                    
                    Text("\(transformacion.name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18))
                        .foregroundStyle(Color("newPrimaryColor"))
                        .padding(20)
                        .lineSpacing(8)
                        .italic()
                        .fontWeight(.bold)
                    
                    AsyncImage(url: URL(string: "\(transformacion.image)" ?? "Imagen"))
                    { result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                            .padding(45)
                            .frame(width: 270, height: 270)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 5)
                                )
                    }.frame(width: 250, height: 250)
                        .background(Color.white)
                    .padding(50)
                }
                
                
                
                
                
            }.padding(15)
        }.background(Color("colorTransformation"))
        
    }
}

#Preview {
    transformacionesPersonaje().environment(ControladorAplicacion())
    
}
