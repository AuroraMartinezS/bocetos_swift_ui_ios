//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI : Codable{
    
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    
    func descargar_publicaciones() async -> [Publicacion]? {
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(post_id: Int) async -> [Comentario]? {
        let ubicacion_recurso = "/posts/\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    
    
    func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_de_servicio)/posts") else {throw ErroresDeRed.badUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
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
        
        catch {
            print ("Oops algo pasó")
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
