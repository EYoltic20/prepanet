//
//  InscriptionsModel.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 29/11/22.
//

import Foundation
import Alamofire
struct jsoninscripcion:Decodable{
    var description: String
    var duracion : Int
    var id : Int
    var nombre : String
    var orden : Int
}
struct modeloinscripcion{
    var description: String
    var duracion : Int
    var id : Int
    var nombre : String
    var orden : Int
}

//
//
class Inscribir{
    let url = "https://prepnet.uc.r.appspot.com/api/alumnos/curso-inscribir/"
    let urlIns = "https://prepnet.uc.r.appspot.com/api/alumnos/inscribir/"
    func gettingData(token:String)async -> modeloinscripcion?{
        let modelo = await load_data(tokenn: token)
        return modelo
    }
    func load_data(tokenn:String)async -> modeloinscripcion?{
        let headers = ["x-auth-token":tokenn]
        
        let Url = URL(string: url)!
        var request = URLRequest(url: Url)
        request.httpMethod = "GET"
        
        for(key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
            
        }
        do{
            
            let (data,_) = try await URLSession.shared.data(for: request)
            let respuesta = try JSONDecoder().decode(jsoninscripcion.self, from: data)
            let description = respuesta.description
            let duracion  = respuesta.duracion
            let id  = respuesta.id
            let nombre = respuesta.nombre
            let orden = respuesta.orden
            return modeloinscripcion(description: description, duracion: duracion, id: id, nombre: nombre, orden: orden)
        }catch{
            return nil
        }
        
    }
    func inscribir(id:Int,token:String)async->Int{
        let headers = ["x-auth-token":token]
        
        let completeUrl = "\(urlIns)\(String(id))/"
        let Url = URL(string: completeUrl)!
        var request = URLRequest(url: Url)
        request.httpMethod = "POST"
        for(key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
            if dataString == "Ya inscribiste esta materia!"{
                return 400
            }

        }catch{
            print("hubo error")
            return 0
        }
        return 0
    }
}
