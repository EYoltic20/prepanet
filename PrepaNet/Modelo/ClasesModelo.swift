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

 class ClasesModelo: ObservableObject{
    @Published var result = [ModelClases]()
    @Published var cursosInactivos=[ModelClases]()
     func loadData(url:String,token:String)async ->([ModelClases],[ModelClases],[ModelClases])? {
         let (modelos,modelosNo,modeloPasado) = await loaddata(Url: url,token: token) ?? ([ModelClases(id: 0, nombre: "''", orden: 0, description: "", duracion: 0, approved: true, status: "")],[ModelClases(id: 0, nombre: "''", orden: 0, description: "", duracion: 0, approved: true, status: "")],[ModelClases(id: 0, nombre: "''", orden: 0, description: "", duracion: 0, approved: true, status: "")])
        return (modelos,modelosNo,modeloPasado)
    }
    
     func loaddata(Url:String,token:String)async -> ([ModelClases],[ModelClases],[ModelClases])?{
        
        let headers = ["x-auth-token":token]
        
        
        let url = URL(string: Url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        for(key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
        do{
            
//            let session = URLSession(configuration: .default)
            var temp = [ModelClases]()
            var temp2 = [ModelClases]()
            var temp3 = [ModelClases]()
            let (data,_) = try await URLSession.shared.data(for: request)
            
            let respuestas = try  JSONDecoder().decode([curso].self, from: data )
//            print(respuestas)

            for respuesta in respuestas{
                let id  = respuesta.id
                let nombre = respuesta.nombre
                let orden = respuesta.orden
                let description = respuesta.description
                let approved = respuesta.approved
                let status = respuesta.estatus
                let duracion = respuesta.duracion
                print(status)
                if status == "Sin Cursar"{
  
                    
                    temp2.append(ModelClases(id: id, nombre: nombre, orden: orden, description: description,duracion: duracion, approved: approved, status: status))
                }else if status == "Cursando"{
                    temp.append(ModelClases(id: id, nombre: nombre, orden: orden, description: description,duracion: duracion, approved: approved, status: status))
                }else{
                    temp3.append(ModelClases(id: id, nombre: nombre, orden: orden, description: description,duracion: duracion, approved: approved, status: status))
                }
                    
            }
            
            return (temp,temp2,temp3) as! ([ModelClases], [ModelClases],[ModelClases])
        }catch{
            print("error")
            return nil
        }
        //       let (data,_) =  session.dataTask(with: request){(data,response,error) in
        //            if error != nil {
        //                print("existio un error\(error?.localizedDescription)")
        //            }
        //            if let safeData = data{
        //                if let cursos = await   self.parsearDatos_Json(cursosData: safeData){
        //                    print(cursos)
        //                    DispatchQueue.main.async {
        //                    self.result = cursos
        //                        self.cursosInactivos = self.getCursosInactivos(cursoM: cursos)
        //
        //                    }
        //                }
        //            }
        //           return data
        //
        //        }
        //        return
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
//    func getCursosInactivos(temp:[ModelClases])async-> [ModelClases]?{
//        var t=[ModelClases]()
//        for curso in temp {
//            if curso.status == "Sin Cursar"{
//                t.append(ModelClases(id: curso.id, nombre: curso.nombre, orden: curso.orden, description: curso.description, duracion: curso.duracion, approved: curso.approved, status: curso.status))
//            }
//        }
//
//        return t
//    }
    
    func parsearDatos_Json(cursosData:Data) -> [ModelClases]?{
        let json = JSONDecoder()
        var temp = [ModelClases]()
        print(cursosData)
        do {
            let respuestas = try  json.decode([curso].self, from: cursosData )
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

