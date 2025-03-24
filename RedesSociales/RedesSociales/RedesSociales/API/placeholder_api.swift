//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI : Codable{
    func descargar_publicaciones(desde: String) async throws -> [Publicacion]? {
        do {
            guard let url = URL(string: desde) else {throw ErroresDeRed.badUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
        }
        catch ErroresDeRed.badUrl {
            print("Direcccion URL incorrecta.")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salió con la respuesta, revisa por favor.")
        }
        catch ErroresDeRed.badStatus {
            print("Bad Status")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Implementación o modelo incorrecto")
        }
        catch ErroresDeRed.invalidRequest {
            print("¿Cómo llegaste aquí?")
        }
        
        return nil;
    }
}


/*
  const fs = require(node: fs)
 
 
 fs.readdir("./json", (err, files) => {
        
 if(err){
 console.log("ERROR")
 }else{
    
    for(i= 0; i < files.length; i++){
        fs.readfile("./json/" + files[i], "utf8", (error, archivo)=>{
            
 
 })
 
 }
 
 }
 
 
 })
 
 
 
 
 */
