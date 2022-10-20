//
//  cursoDetalleView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 17/10/22.
//

import SwiftUI

struct cursoDetalleView: View {
    var curso : ClasesModelo
    var body: some View {
        VStack(alignment:.center){
            ScrollView{
                
                VStack(alignment:.center,spacing:40){
                    Text("\(curso.nombre)")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(curso.descripcion)")
                        .font(.title2)
                    Text("\(curso.periodo)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Circle()
                        .fill(curso.calificacion > 70 ? .green : .red).opacity(0.7)
                        .opacity(0.3)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                        .frame(width:150,height:150)
                        .overlay{
                            Text("\(curso.calificacion)%")
                                .font(.title)
                                .fontWeight(.bold)
                                .font(.system(size: 50))
                        }
                }.frame(maxWidth:300,maxHeight: .infinity)
                    .padding()
            }
            
        }
    }
    
}

struct cursoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        cursoDetalleView(curso:ClasesModelo(nombre: "", calificacion: 10, descripcion: "", dar_de_baja: true, estado: true, perdiodo: ""))
    }
}
