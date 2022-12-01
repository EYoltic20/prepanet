//
//  Usuario_Modelo.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 30/11/22.
//

import Foundation
struct respuesta:Decodable{
    var token : String
}

class Usuario_Modelo : ObservableObject{
    let urlEntrar = "https://prepnet.uc.r.appspot.com/api/auth/generate-token"
    let url_dar_de_baja = "https://prepnet.uc.r.appspot.com/api/alumnos/desinscribir/"
//    func login(user:String,password:String)async-> String{
    
    
    
    
//    MARK: -POR QUE NO JALO!!!
//        let params = [
//            "email":user,
//            "password":password
//        ]
//        let jsonBody = try? JSONSerialization.data(withJSONObject: params,options: .fragmentsAllowed)
//        print( try? JSONDecoder().decode(probando.self, from: jsonBody!))
//        let url = URL(string: urlEntrar)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params,options: .prettyPrinted)
//        do{
//            let (data,_) = try await URLSession.shared.data(for: request)
//            let respestaString = String(data: data, encoding: .utf8)
//            print(respestaString!)
//            return respestaString!
//        }catch{
//            print("Hubo un error")
//            return ""
//        }
//
//    }
    func dar_de_baja(token:String)async->Bool{
        let headers = ["x-auth-token":token]
        
        
        let url = URL(string: url_dar_de_baja)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        for(key,value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            return true
        }catch{
            print("hubo un eror")
            return false
        }
    }
    @Published var x_token:String{
        didSet{
            UserDefaults.standard.set(x_token,forKey: "llave")
        }
    }
    @Published var isLogged : Bool{
        didSet{
            UserDefaults.standard.set(isLogged, forKey: "loggin")
        }
    }
    init(){
        self.isLogged = false
        self.x_token = ""
    }
}
