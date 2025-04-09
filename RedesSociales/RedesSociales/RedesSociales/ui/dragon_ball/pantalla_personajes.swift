//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    let esquinas_redondeadas = CGSize(width: 15, height: 15)
    
    var body: some View{
        if(controlador.pagina_resultados != nil){
            NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){ personaje in
                        NavigationLink{
                            Personaje()
                        } label: {
                        
                        VStack(){
                           Text("\(personaje.name)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(20)
                                .foregroundStyle(Color.teal)
                            AsyncImage(url: URL(string:personaje.image))
                            { result in
                                    result.image?
                                    .resizable()
                                    .scaledToFill()
                                    }
                                    .frame(width: 120, height: 120)
                                    .padding(100)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.teal)
                                    .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                            Text("\(personaje.race) - \(personaje.gender)\nAfiliación: \(personaje.affiliation)\nBaseKi: \(personaje.ki)\nTotal KI: \(personaje.maxKi)")
                                 .frame(maxWidth: .infinity, alignment: .leading)
                                 .multilineTextAlignment(.leading)
                                 .font(.system(size: 18))
                                 .fontWeight(.semibold)
                                 .foregroundStyle(Color("newPrimaryColor"))
                                 .padding(20)
                                
                        }
                        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(.teal, lineWidth: 2))
                        
                        } //ESTE ES DEL LABEL
                        .simultaneousGesture(TapGesture().onEnded({
                            controlador//.seleccionar_personaje(personaje)
                                .descargar_informacioncompleta_personaje(id: personaje.id)
                        }))
                    }
                    
                }.padding(15)
                    
            }
        }
            

    }
        
    }
}

#Preview {
   PantallaPersonaje()
        .environment(ControladorAplicacion())
}
