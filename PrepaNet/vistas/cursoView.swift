//
//  cursoView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 11/10/22.
//

import SwiftUI

struct cursoView: View {
    var curso :String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.blue)
            .overlay{
                VStack{
                    Capsule()
                        .fill(.gray)
                        .opacity(0.6)
                        .overlay{
                            Text("59%")
                                .font(.caption)
                        }
                        .offset(x:30,y:-30)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 3, y: 3)
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
