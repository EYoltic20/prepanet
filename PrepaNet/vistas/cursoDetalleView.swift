//
//  cursoDetalleView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 17/10/22.
//

import SwiftUI

struct cursoDetalleView: View {
    var curso : ClasesModelo
    var opciones = ["Dar de baja","Personas","Instructor"]
    var body: some View {
        VStack(alignment:.center){
            ScrollView{
                
                VStack(alignment:.center,spacing:40){
                    Text("\(curso.nombre)")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(curso.descripcion)")
                        .font(.title2)
                    Text("\(curso.periodoInicio)")
                        .font(.title)
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
                    Text("Opciones").font(.title).fontWeight(.bold)
//                    MARK: -Boton por si se dio de baja el pana
                    if curso.dar_de_baja || !curso.estado{
                        
                    }else{
                        Button{
                            curso.dar_de_baja = false
                        }label: {
                            Rectangle()
                                .fill(.red)
                                .frame(width:.infinity,height: 60)
                                .cornerRadius(10)
                                .overlay{
                                    Text("Dar de baja la materia")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                            }
                        }.padding()
                    }
                    
                    
                }
                        
                }.frame(maxHeight: .infinity)
                    .padding()

            }
            
        }
    }
    


struct cursoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        cursoDetalleView(curso:ClasesModelo(nombre: "", calificacion: 10, descripcion: "", dar_de_baja: true, estado: true, periodoInicio: "",periodoFinal: ""))
    }
}
