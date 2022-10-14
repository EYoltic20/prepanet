//
//  AutentificacionView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 14/10/22.
//

import SwiftUI

struct AutentificacionView: View {
    @State var codigo: String = ""
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                VStack(alignment:.center){
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .overlay{
                            //                MARK: -informacion
                            VStack{
                                Text("Doble Factor De Autentificación")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                                TextField("Introduzca el codigo",text: $codigo)
                                    .frame(width:200,height: 50)
                                    .overlay(Divider().foregroundColor(.black),alignment: .bottom)
                                    .padding()
                                NavigationLink( destination: dashBoardView(), label: {
                                           RoundedRectangle(cornerRadius: 20)
                                               .frame(width:100,height: 50)
                                               .overlay{
                                                   Text("Ingresar")
                                                       .fontWeight(.semibold)
                                                       .foregroundColor(.white)
                                               }
                                    
                                               })
                            }
                        }
                        .shadow(color: .black.opacity(0.5), radius: 20, x: 10, y: 10)
                    
                    
                }.frame(width:350,height: 300)
            }.frame(maxWidth:.infinity,maxHeight: .infinity)
                .background{
                    Fondo_Vista()
                }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: -GENERAR FONDO
struct Fondo_Vista:View{
    var body: some View{
        VStack{
            Circle()
                .fill(.black)
                .frame(width:400)
                .offset(x: -200, y:-400 )
            //            Circle()
            //                .fill(.black)
            //                .frame(width:200)
            //                .offset(x: 200, y:-400 )
        }
    }
}

struct AutentificacionView_Previews: PreviewProvider {
    static var previews: some View {
        AutentificacionView()
    }
}
