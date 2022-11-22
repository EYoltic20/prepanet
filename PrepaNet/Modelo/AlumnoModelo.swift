//
//  AlumnoModelo.swift
//  PrepaNet
//
//  Created by Alan Jesus Galvan Valles on 18/11/22.
//

import Foundation

struct AlumnoModelo{
    let nombre: String
    let apellido: String
    let matricula: String
    let campus: String
    }
struct AlumnoJson:Decodable{
    let campus:campusOption
    let first_name:String
    let last_name:String
    let matricula:String
    
}
struct campusOption:Decodable{
    let name : String
}
class AlumnoGet{
    func loadData()async -> AlumnoModelo?{
        let cargando_los_datos = await obteniendoResultados()
        return cargando_los_datos
    }
    func obteniendoResultados() async ->AlumnoModelo?{
        let headers = ["x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2ODcxNjkxNH0.U7GiSmP6TKwoWfRU5SvJaPDcsDOvjl3yluZfOkdVOXs"]
        
        let url = URL(string: "https://prepnet.uc.r.appspot.com/api/alumnos/profile")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        for(key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
        do{
//            let temporal = AlumnoModelo()

            let (data,_) = try await URLSession.shared.data(for: request)
            
            let respuestas = try  JSONDecoder().decode(AlumnoJson.self, from: data )
            let nombre = respuestas.first_name
            let apellido = respuestas.last_name
            let matricula = respuestas.matricula
            let campus = respuestas.campus
            print(AlumnoModelo(nombre: nombre, apellido: apellido, matricula: matricula, campus: campus.name))
            return AlumnoModelo(nombre: nombre, apellido: apellido, matricula: matricula, campus: campus.name)
//            for
        }catch{
            print("error")
            return nil
        }
    }
}
