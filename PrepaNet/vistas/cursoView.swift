//
//  cursoView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 11/10/22.
//

import SwiftUI

struct cursoView: View {
    var curso :String
    var colo : Color
    var  calificacion = 50
    
    var body: some View {
        
        Image(regresar_nombre(nombre: curso))
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 15))
        
            .aspectRatio(contentMode: .fit)


//            .blur(radius: 3)
            .overlay{
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colo)
                        .frame(width:150,height:40)
                        .overlay{
                            Text(curso)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                }.offset(y:40)
            }
    }
}

struct cursoView_Previews: PreviewProvider {
    static var previews: some View {
        cursoView(curso: "MATE",colo: Color.blue)
    }
}
