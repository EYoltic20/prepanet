//
//  ClasesModelo.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 13/10/22.
//

import Foundation
import Alamofire
struct curso: Decodable{
    //    let id : Int
    //    let nombre: String
    //    let orden: Int
    //    let description : String
    //    let duracion : Int
    //    let approved: Bool
    //    let status : String
    let approved: Bool
    let description: String
    let duracion:Int
    let estatus:String
    let id : Int
    let nombre:String
    let orden: Int
}
struct ModelClases{
    let id : Int
    let nombre: String
    let orden: Int
    let description : String
    let duracion : Int
    let approved: Bool
    let status : String
}
final class ClasesModelo: ObservableObject{
    @Published var result = [ModelClases]()
    
        func loadData(Url:String){
            let headers = ["x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2ODcxNjkxNH0.U7GiSmP6TKwoWfRU5SvJaPDcsDOvjl3yluZfOkdVOXs"]
    
            let url = URL(string: Url)!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
    
            for(key,value) in headers{
                request.setValue(value, forHTTPHeaderField: key)
            }
    
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request){(data,response,error) in
                if error != nil {
                    print("existio un error\(error?.localizedDescription)")
                }
                if let safeData = data{
                    if let cursos = self.parsearDatos_Json(cursosData: safeData){
                        print(cursos)
                        self.result = cursos
                    }
                }
    
            }
            task.resume()
        }
    
//    func loadData(Url: String){
//        let headers : HTTPHeaders =  ["x-auth-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2ODcxNjkxNH0.U7GiSmP6TKwoWfRU5SvJaPDcsDOvjl3yluZfOkdVOXs"]
//        DispatchQueue.main.async {
//
//
//            AF.request(Url,method: .get,parameters: [:],encoding: URLEncoding.queryString,headers: headers).validate().responseJSON {response ->Void in
//                print(response.value)
//                do{
//                let json = try  JSONDecoder().decode([curso].self, from: response.data!)
//
//                }catch let erro{
//                    print(erro)
//                }
//
//                //            if let  safeData = response.data{
//                //               if  let curso = self.parsearDatos_Json(cursosData:safeData){
//                //                    self.result  = curso
//                //                    return
//                //
//                //                }
//                //            }
//
//            }
//        }
//    }
    func parsearDatos_Json(cursosData:Data) ->[ModelClases]?{
        let json = JSONDecoder()
        var temp = [ModelClases]()
        print(cursosData)
        do {
            let respuestas = try json.decode([curso].self, from: cursosData )
            print(respuestas)
            for respuesta in respuestas{
                let id  = respuesta.id
                let nombre = respuesta.nombre
                let orden = respuesta.orden
                let description = respuesta.description
                let approved = respuesta.approved
                let status = respuesta.estatus
                let duracion = respuesta.duracion
                temp.append(ModelClases(id: id, nombre: nombre, orden: orden, description: description,duracion: duracion, approved: approved, status: status))
                
            }
            return temp
        }catch{
            return nil
        }
    }
}

