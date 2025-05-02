//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI
//Galeria para usar fotos.
import PhotosUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("backgroundColor"),
                    Color("newPrimaryColor")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            HStack(){
                
                ZStack(alignment:.bottomTrailing){
                    PhotosPicker(selection: $foto_seleccionada){
                        Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatarPersona))
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 120, height: 120)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 60)
                                    .stroke(Color("BlancoTenue"), lineWidth: 5)
                            )
                    }
                    .onChange(of: foto_seleccionada) {valor_anterior, valor_nuevo in
                        Task{
                            if let foto_seleccionada, let datos = try? await
                                foto_seleccionada.loadTransferable(type: Data.self){
                                if let imagen = UIImage(data:datos){
                                    foto_a_mostrar = imagen
                                }
                            }
                        }
                    }
                    Image(systemName: "pencil")
                        .padding(4)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.indigo)
                    
                }
                
                VStack(){
                    Text("User: \(controlador.perfil_a_mostrar?.username ?? "XDSDFRE")")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Aurora")")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "asdasdo@gmail.com")")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            }
            .frame(maxWidth: . infinity)
            .padding(30)
        }
        
        
    }
    
}

#Preview{
    PerfilBasicoVista().environment(ControladorAplicacion())
}
