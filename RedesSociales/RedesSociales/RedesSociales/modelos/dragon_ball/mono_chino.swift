//
//  personaje.swift
//  RedesSociales
//
//  Created by alumno on 4/2/25.
//

struct MonoChino: Identifiable, Codable{
    
        let id : Int
        let name: String
        let ki: String
        let maxKi: String
        let race: String
        let gender: String
        let description: String
    
        let image: String
        let affiliation: String
        let originPlanet: Planeta?
        //let transformation: Array<Transformacion
        let transformations : [Transformacion]?
    }

