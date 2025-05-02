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
                
                Text("\(controlador.personajemonoChino?.name ?? "Nombre personaje")" )
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(10)
                    .foregroundStyle(Color.teal)
                
                AsyncImage(url: URL(string:controlador.personajemonoChino?.image ?? "Imagen"))
                { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fit)
                }.frame(width: 220, height: 220)
                    .padding(10)
                    .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                
                NavigationLink{
                    planetaOrigen()
                } label: {
                    
                    Text("Planeta de origen: \(controlador.personajemonoChino?.originPlanet?.name ?? "Planeta de origen")")
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.teal)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                }

                Text("\(controlador.personajemonoChino?.race ?? "Raza") - \(controlador.personajemonoChino?.gender ?? "Género")\nAfiliación: \(controlador.personajemonoChino?.affiliation ?? "Afilación")\nBaseKi: \(controlador.personajemonoChino?.ki ?? "KI")\nTotal KI: \(controlador.personajemonoChino?.maxKi ?? "totalKI")")
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .multilineTextAlignment(.leading)
                     .font(.system(size: 18))
                     .fontWeight(.semibold)
                     .foregroundStyle(Color("newPrimaryColor"))
                     .padding(20)
                     .background(Color.white)
                     .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                
                NavigationLink{
                    transformacionesPersonaje()
                } label: {
                    Text("Transformaciones")
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                }
                
                Text("\(controlador.personajemonoChino?.description ?? "Descripción")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundStyle(Color("newPrimaryColor"))
                    .padding(20)
                    .lineSpacing(8)
            }.padding(15)
        }.background(Color("backgroundColor"))
    }
}

#Preview {
    NavigationStack{
        Personaje()
            .environment(ControladorAplicacion())
    }
}

