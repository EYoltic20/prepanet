//
//  ContentView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 30/09/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var matricula=""
    @State var password = ""
    @State var isHidden = true
    @State  var isActiveNormal = false
    @State var estado = 0
    @State var alerta = false
    @EnvironmentObject var entrar : Usuario_Modelo
    
    var body: some View {
        NavigationView{
            
            VStack(alignment:.center){
                NavigationLink(destination:Comprobar(),isActive: $isActiveNormal){
                    EmptyView()
                }
                .hidden()
                Image("LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(width:200,height: 200,alignment: .center)
                    .padding()
                VStack(alignment:.leading,spacing:20){
                    
                    //            MARK: - inputes de loggin
                    Text("Matricula")
                        .font(.title3)
                    TextField("A00000",text: $matricula)
                        .textFieldStyle(.plain)
                        .overlay(Divider().foregroundColor(.black),alignment: .bottom)
                    Text("Contraseña")
                        .font(.title3)
//                     MARK: -SECURE
                    if isHidden{
                    HStack{
                        SecureField("Password",text:$password)
                            .textFieldStyle(.plain)
                        Spacer()
                        
                        Button{
                            isHidden.toggle()
                        }label: {
                            Image(systemName: isHidden ? "eye.slash":"eye")
                                .foregroundColor(.black)
                        }
                    }       .overlay(Divider().foregroundColor(.black),alignment: .bottom)
                    }
                    else{
                    HStack{
                        TextField("Password",text:$password)
                            .textFieldStyle(.plain)
                        Spacer()
                        
                        Button{
                            isHidden.toggle()
                        }label: {
                            Image(systemName: isHidden ? "eye.slash":"eye")
                                .foregroundColor(.black)
                        }
                    }       .overlay(Divider().foregroundColor(.black),alignment: .bottom)
                    }
        
                }
                .frame(width:300,height: 100)
                .padding()
                .padding(.bottom,10)
                //        MARK: -Bottones
                Spacer()
                VStack(alignment:.center){
                    
                    
                    Button{
                        //                       estado =  conexion.login(email: matricula, password: password)
                        //                        conexion.login(email: matricula, password: password)
                        login(email: matricula, password: password)
                    }label: {
                        Text("Ingresar")
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .frame(width:130,height:30)
                            .background{
                                Capsule(style: .continuous)
                                    .fill(.white)
                                    .frame(width:200,height: 50)
                            }
                    }
                    
                }.padding()
                //                MARK: -FUGA A VERTIFICAION
                
                
                    .frame(maxWidth:.infinity,maxHeight: .infinity)
                    .background{
                        Image("imagenUno")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                        
                    }.padding(.top,200)
                
            }.alert(isPresented: $alerta){
                Alert(title: Text("Usuario No Identificado"), message: Text("La contraseña o el usuario son incorrectas"), dismissButton:.default(Text("Ok")))
            }
            
            
        }
        
    }
    func login(email:String,password:String){
        let params = [
            "email":"\(email)",
            "password":"\(password)"
        ]
        //        var array : [String:String]?
        
            
            
            AF.request("https://prepnet.uc.r.appspot.com/api/auth/generate-token",method:.post,parameters:params,encoding:URLEncoding.httpBody).responseJSON{response in
                do {
                    let respuesta = try JSONDecoder().decode(respuesta.self, from: response.data! )
                    print(respuesta)
                    isActiveNormal.toggle()
                    entrar.x_token = respuesta.token
                    entrar.isLogged = true
                }catch{
                    entrar.isLogged = false
                    alerta.toggle()
                    return
                }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
