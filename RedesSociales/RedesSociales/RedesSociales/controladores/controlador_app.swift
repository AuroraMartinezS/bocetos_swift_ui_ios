//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor //esta clase se ejecuta sobre el hilo principal tiene control sobre los otros hilos

public class ControladorAplicacion{
    
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    var personajes: Array<MonoChino> = [] // NUEVO
    var planetas: Array<Planeta> = []
    
    var personaje_seleccionado : MonoChino? = nil
    var publicacion_seleccionada : Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    var planeta_seleccionado: Planeta? = nil
    
    //seccion dragon ball
    var pagina_resultados : PaginaResultados? = nil
    var personajemonoChino: MonoChino? = nil
    var planetasResultados: PaginaResultadosPlanetas? = nil
    var planetaplanetita: Planeta? = nil
    
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
            
            await self.descargar_planetas()
        }
    }
    
    func descargar_monos_chinos() async {
        guard let pagina_descargada: PaginaResultados = try? await DragonBallAPI().descargar_pagina_personajes() else {return}
        
        self.pagina_resultados = pagina_descargada
        personajes = pagina_descargada.items // NUEVO
        
        await print(DragonBallAPI().descargar_pagina_personajes())
    }
    
    //descargar planetas
    
    func descargar_planetas() async {
        guard let pagina_descargada: PaginaResultadosPlanetas = try? await DragonBallAPI().descargar_pagina_planetas() else {return}
        self.planetasResultados = pagina_descargada
        planetas = pagina_descargada.items
        
    }
    
    func descargar_info_planeta(id: Int) async {
        guard let planetita: Planeta = try? await DragonBallAPI().descargar_informacion_planetas(id: id) else {return}
        self.planetaplanetita = planetita;
    }
    
    func descargar_informacioncompleta_planeta(id: Int){
        Task.detached(operation: {
            await self.descargar_info_planeta(id: id)
        })
    }
    
    
    //ESTO ES NUEVO
    func descargar_info_personaje(id: Int) async {
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else {return}
        self.personajemonoChino = mono_chino;
    }
    
    func descargar_informacioncompleta_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    
    
    
    
    func descargar_publicaciones() async {
        
        defer{
            print("Esta función se mando a llamar después de todos los awaits en mi función \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else{
            return
        }
        publicaciones = publicaciones_descargadas;
    }
    
    func descargar_comentarios() async {
        
        defer{
            print("Esta función se mando a llamar después de todos los awaits en mi función \(#function)")
        }
        
        guard let comentarios_descargadas: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else{
            return
        }
        comentarios = comentarios_descargadas;
    }
    
    func seleccionar_personaje(_ personaje: MonoChino)-> Void{
        personaje_seleccionado = personaje    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void{
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
    }
    
    func descargar_perfil(id: Int) async -> Void {
            guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
            perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void {
        Task.detached{await self.descargar_perfil(id: id)}
    }
    
}
