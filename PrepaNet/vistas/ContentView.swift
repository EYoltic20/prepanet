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
                VStack(alignment:.leading,spacing:20){
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
                    .padding(.bottom,60)
                //        Mark: -Bottones
                VStack(alignment:.center){
                    NavigationLink(destination:dashBoardView(),label: {
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
                            .padding(.bottom,100)
                            
                    })
                    
                }
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background{
                    Image("imagenUno")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
            
                }
                
                
            }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
