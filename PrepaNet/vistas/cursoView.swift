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
    var calificacion = 50
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colo)
//            .blur(radius: 3)
            .overlay{
                VStack{
                    Text("\(curso)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title3)
                }
            }
    }
}

struct cursoView_Previews: PreviewProvider {
    static var previews: some View {
        cursoView(curso: "MATE",colo: Color.blue)
    }
}
