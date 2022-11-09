//
//  InscripcionesView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/11/22.
//

import SwiftUI
import Lottie
struct InscripcionesView: View {
    
    var body: some View {
        
        ZStack{
            animacion(url: "https://assets1.lottiefiles.com/packages/lf20_y5ljuke8.json").frame(width:400,height:400)
        VStack(spacing:70){
            
            Text("Proximo curso disponible")
                .font(.title)
                .fontWeight(.bold)
                .font(.system(size: 20))
            //            MARK: -Construccioon del cuadro del curso
            Rectangle()
                .cornerRadius(10)
                .frame(maxWidth:.infinity,maxHeight: 100)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 22, y: 15)
                .overlay{
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth:.infinity,maxHeight: 40,alignment: .bottom)
                        .opacity(0.5)
                        .cornerRadius(10)
                    
                        .overlay{
                            Text("Mis Habilidades y motivaciones")
                                .font(.title3)
                                .bold()
                            
                        }
                        .padding(.top,59.5)
                }
            
            
            Button{
                
            }label:{
                Rectangle()
                    .fill(.green)
                    .cornerRadius(10)
                    .frame(width:200,height: 70)
                    .overlay{
                        Text("Inscribir").foregroundColor(.white)
                    }
            }
        }
        .padding()
        }
    }
    
}



struct InscripcionesView_Previews: PreviewProvider {
    static var previews: some View {
        InscripcionesView()
    }
}
