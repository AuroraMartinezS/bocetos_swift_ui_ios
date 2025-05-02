//
//  pantalla_planetas.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI

struct PantallaPlaneta: View {
    @Environment(ControladorAplicacion.self) var controlador
    let esquinas_redondeadas = CGSize(width: 15, height: 15)
    
    var body: some View{
        if(controlador.planetasResultados != nil){
            NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(controlador.planetasResultados!.items){ planetas in
                        NavigationLink{
                            PlanetaSeleccionado()
                        } label: {

                        VStack(){
                           Text("\(planetas.name)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(20)
                                .foregroundStyle(Color.green)
                            AsyncImage(url: URL(string:planetas.image))
                            { result in
                                    result.image?
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fit)
                                    }
                            .frame(width: .infinity, height: .infinity)
                            .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .shadow(color: Color.black, radius: 5, x: 0, y: 1)
                                
                        }
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(.green, lineWidth: 2))
                                
                        
                        } //ESTE ES DEL LABEL
                        .simultaneousGesture(TapGesture().onEnded({
                            controlador//.seleccionar_personaje(personaje)
                                .descargar_informacioncompleta_planeta(id: planetas.id)
                        }))
                    }
                    
                }.padding(15)
                    
            }
        }
            

    }
        
    }
}

#Preview {
    PantallaPlaneta()
        .environment(ControladorAplicacion())
}

