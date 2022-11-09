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
//                    Circle()
//                        .fill(curso.calificacion > 70 ? .green : .red).opacity(0.7)
//                        .opacity(0.3)
//                        .shadow(color: .black, radius: 10, x: 10, y: 10)
//                        .frame(width:150,height:150)
//                        .overlay{
//                            Text("\(curso.calificacion)%")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .font(.system(size: 50))
//                        }
//                    MARK: -Implementacion del circulo
                    Construyendo_circulo(incremento: curso.calificacion)
                        .frame(width: 200  , height: 200, alignment: .center)
                    
                    
        
//                    MARK: -Boton por si se dio de baja el pana
                    if curso.dar_de_baja || !curso.estado{
                        
                    }else{
                        Button{
                            curso.dar_de_baja = false
                        }label: {
                            Rectangle()
                                .fill(.red)
                                .frame(width:.infinity
                                       ,height: 60)
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
    @ViewBuilder
    func Construyendo_circulo(incremento:Int)->some View{
        let percentage = CGFloat(incremento) / CGFloat(100)
        ZStack{
            Circle()
                .stroke(lineWidth: 30)
                .opacity(0.2)
                .foregroundColor(incremento>70 ? .green : .red)
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(style: StrokeStyle(lineWidth:30,lineCap: .round,lineJoin: .round))
                .foregroundColor(incremento>70 ? .green : .red)
                .rotationEffect(Angle(degrees: 270))
                
                .animation(.linear)
                
            Text("\(incremento)%")
                .foregroundColor(incremento>70 ? .green : .red)
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
    }
    }
    


struct cursoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        cursoDetalleView(curso:ClasesModelo(nombre: "", calificacion: 10, descripcion: "", dar_de_baja: true, estado: true, periodoInicio: "",periodoFinal: ""))
    }
}
