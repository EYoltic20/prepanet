//
//  ClasesModelo.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 13/10/22.
//

import Foundation
class ClasesModelo{
    var nombre : String
    var calificacion : Int
    var descripcion : String
    var dar_de_baja : Bool
    var periodoInicio : String
    var periodoFinal : String
    //    var requerimienitos : String
    var estado : Bool
    init(nombre:String,calificacion:Int,descripcion:String,dar_de_baja:Bool,estado:Bool,periodoInicio : String,periodoFinal : String){
        self.nombre = nombre
        self.calificacion = calificacion
        self.descripcion = descripcion
        self.dar_de_baja = dar_de_baja
//        self.requerimienitos = requerimientos
        self.estado = estado
        self.periodoInicio  = periodoInicio
        self.periodoFinal  = periodoFinal
    }
}
