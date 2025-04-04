//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 4/2/25.
//

import SwiftUI

class DragonBallAPI: Codable{
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultados?{
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_base)\(recurso)") else {throw ErroresDeRed.badUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo es: \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
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
            print("EN DRAGON BALL API")
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
