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
        let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
        
        ScrollView{
            
            Text("Transformaciones")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .padding(20)
                .frame(maxWidth: . infinity, maxHeight: . infinity)
                .foregroundStyle(Color.orange)
            
            LazyVGrid(
                  columns: [
                      GridItem(.flexible(minimum: 30, maximum: .infinity)),
                      GridItem(.flexible(minimum: 30, maximum: .infinity))
                  ],
                  alignment: .leading,
                  spacing: 2
              ) {
                  ForEach(controlador.personajemonoChino?.transformations ?? transformaciones){transformacion in
                      
                      VStack(){
                          Text("\(transformacion.name)")
                              .font(.system(size: 16))
                              .multilineTextAlignment(.center)
                              .foregroundStyle(Color.orange)
                              .padding(10)
                              .italic()
                              .fontWeight(.bold)
                              .background(Color.white)
                              .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                          
                          AsyncImage(url: URL(string: "\(transformacion.image)" ?? "Imagen"))
                          { result in
                              result.image?
                                  .resizable()
                                  .scaledToFill()
                                  .padding(40)
                                  .frame(width: 160, height: 160)
                                  .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                                  .overlay(
                                      RoundedRectangle(cornerRadius: 10)
                                          .stroke(Color.orange, lineWidth: 5)
                                      )
                                  .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                          }.frame(width: 150, height: 150)
                              .background(Color.white)
                          .padding(15)
                      }.padding(5)
                  }
              }
            
            
            /* TERMINA PRUEBA CON GRID*/
    
           /* VStack(){
                Text("Transformaciones")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(20)
                    .frame(maxWidth: . infinity, maxHeight: . infinity)
                    .foregroundStyle(Color.orange)
                
                ForEach(controlador.personajemonoChino?.transformations ?? transformaciones){transformacion in
                    
                    Text("\(transformacion.name)")
                        .font(.system(size: 18))
                        .foregroundStyle(Color("newPrimaryColor"))
                        .padding(15)
                        .italic()
                        .fontWeight(.bold)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                    AsyncImage(url: URL(string: "\(transformacion.image)" ?? "Imagen"))
                    { result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                            .padding(60)
                            .frame(width: 250, height: 250)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 5)
                                )
                            .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                    }.frame(width: 250, height: 250)
                        .background(Color.white)
                    .padding(20)
                }
 
            }.padding(15)*/
        }.padding(15)
        .background(Color("colorTransformation"))
        
    }
}

#Preview {
    transformacionesPersonaje().environment(ControladorAplicacion())
    
}
