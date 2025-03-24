//
//  Publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

// Identifiable se debe de implementar para todo lo que quieras mostrar en pantalla.
/*
 Codable -> Permite convertir la estructura en un archivo JSON y viceversa (Encodable y Codable en una sola función).
 Encodable -> Permite convertir la estructura en un archivo JSON
 Decodable -> Permite convertir el archivo JSON en una estructura.
 */

struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}


