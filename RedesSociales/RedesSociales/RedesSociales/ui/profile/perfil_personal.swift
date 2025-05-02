//
//  perfil_personal.swift
//  RedesSociales
//
//  Created by alumno on 4/30/25.
//

import SwiftUI
import PhotosUI

struct perfil_personal: View {
    var body: some View {
        
        @State var foto_seleccionada: PhotosPickerItem? = nil
        @State var foto_a_mostrar: UIImage? = nil
        
        
        
        ZStack {
                LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.70, green: 0.90, blue: 0.95),
                    Color(red: 0.60, green: 0.85, blue: 0.75)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
            
            VStack(){
                HStack(){
                    ZStack(alignment:.bottomTrailing){
                        PhotosPicker(selection: $foto_seleccionada){
                            Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatarPersona))
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 100)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
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
                            .padding(2)
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                            .foregroundColor(.cyan)
                    }
                
                    VStack(){
                        Text("Aurora Martínez")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Estudiante")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(15)
                }
                .frame(maxWidth: . infinity)
                
                
                HStack(){
                    Image(systemName: "phone.fill")
                        .foregroundColor(.cyan)
                    Text("656 309 1234")
                }
                .padding(15)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("BlancoTenue"))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
                
                HStack(){
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.cyan)
                    Text("aurora123@gmail.com")
                        .foregroundColor(.black)
                }
                .padding(15)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("BlancoTenue"))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
            }
            .padding(30)
            .frame(maxWidth: . infinity)
        }
        
    }
}

#Preview {
    perfil_personal()
}
