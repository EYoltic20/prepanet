//
//  regresarnombre_foto.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 29/11/22.
//

import Foundation

func regresar_nombre(nombre:String)->String{
    switch nombre{
    case "Liderazgo Positivo y Transformación Personal":
        return "lide1"
    case "Mis habilidades y motivaciones ":
        return "prepanetIns"
    case "Mis emociones":
        return "emociones"
    case "Mis relaciones":
        return  "relaciones"
    case "Mis áreas de oportunidad":
        return "foto_curso_uno"
    case "Mis metas":
        return "metas"
    default:
        return "metas"
    }
}
