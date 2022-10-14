//
//  cursoView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 11/10/22.
//

import SwiftUI

struct cursoView: View {
    var curso :String
    var calificacion = 50
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.blue)
            .overlay{
                VStack{
                    Capsule()
                        .fill(calificacion < 70 ? .red : .green)
                        .opacity(0.6)
                        .overlay{
                            Text("\(calificacion)%")
                                .font(.caption)
                                .fontWeight(.bold)
//                                .for
//                            poner cambio de color
                        }
                        .offset(x:30,y:-30)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 10, y: 10)
                        .frame(width:50,height:30)
                        
                    Text("\(curso)")
                }
                
            }
    }
}

struct cursoView_Previews: PreviewProvider {
    static var previews: some View {
        cursoView(curso: "MATE")
    }
}
