//
//  LoginViewModel.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 16/11/22.
//

import Foundation
import SwiftUI
import Alamofire

class ConexionViewModel:ObservableObject{
    var url = "https://prepnet.uc.r.appspot.com"
    
    //   MARK: - Hacer el login
//    func login(email:String,password:String){
////        var respuesta = 0
//        let params = [
//            "email":"\(email)",
//            "password":"\(password)"
//        ]
////        var array : [String:String]?
//        let this =
//         AF.request("https://prepnet.uc.r.appspot.com/api/auth/generate-token",method:.post,parameters:params,encoding:URLEncoding.httpBody).responseJSON{response in
//            switch response.result{
//            case .success(let value):
//                print(value)
//                return
//            case .failure(let error):
//                print(error)
//                return
//
//
//        }
//        }
//
//
//
//
        
        //        let json: [String:String] = ["email":email,"password":password]
        //
        ////        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        //
        ////        Creamos la peticion post
        //        let makingurl = "https://prepnet.uc.r.appspot.com/api/auth/generate-token"
        //        var request = URLRequest(url: URL(string: makingurl)!)
        //
        //        request.httpMethod = "POST"
        //        request.setValue("aplication/json", forHTTPHeaderField: "Content-Type")
        //
        ////        Insertamos el body
        //        request.httpBody = try? JSONSerialization.data(withJSONObject: json,options:.fragmentsAllowed)
        //
        //
        //
        //        let task = URLSession.shared.dataTask(with: request){data,response,error in
        //            guard let data = data , error == nil else{
        //                print(error?.localizedDescription ?? "no data")
        //                return
        //            }
        //            do{
        //
        //                let response = try JSONSerialization.jsonObject(with: data,options: .allowFragments) as![String:String]
        //                print("bien \(response)")
        //            }
        //            catch{
        //                print(response)
        //                print(error)
        //            }
        //        }
        //
        //        print("hey")
        //        task.resume()
        //
    }

//}
