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
        
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "XDSDFRE")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Aurora")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "asdasdo@gmail.com")")
         
        
        PhotosPicker(selection: $foto_seleccionada){
            Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatarPersona))
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
    }
}

#Preview{
    PerfilBasicoVista().environment(ControladorAplicacion())
}
