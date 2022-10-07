//
//  ContentView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 30/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var matricula=""
    @State var password = ""
    @State var isHidden = true
    @State  var isActiveNormal = false
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment:.leading,spacing:35){
                    //            MARK: - inputes de loggin
                    Text("Matricula")
                        .font(.title3)
                    TextField("A00000",text: $matricula)
                        .textFieldStyle(.plain)
                        .overlay(Divider().foregroundColor(.black),alignment: .bottom)
                    Text("Contraseña")
                        .font(.title3)
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
                }.padding()
                    .frame(width:300,height: 700)
                Spacer()
                //        Mark: -Bottones
                VStack{
                    ZStack{
                        Image("imagenUno")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                        
                        
                        
                        VStack(spacing:10){
                            
                            NavigationLink(destination:dashBoardView(),label: {
                                Text("Ingresar")
                                    .foregroundColor(.black)
                                    .frame(width:130,height:30)
                                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                            })
                            Text("Ingresear  por correo")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            HStack{
                                Spacer()
                                Button{
                                    
                                }label: {
                                    Text("Google")
                                        .foregroundColor(.black)
                                        .frame(width:130,height:30)
                                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                                }
                                Spacer()
                                Button{
                                }label: {
                                    Text("Outlook")
                                        .foregroundColor(.black)
                                        .frame(width:130,height:30)
                                        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
                                }
                                Spacer()
                            }
                        }
                    }
                    
                }
                .frame(maxWidth:.infinity,maxHeight: 40)
                
            }
            .navigationBarBackButtonHidden(true)
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
