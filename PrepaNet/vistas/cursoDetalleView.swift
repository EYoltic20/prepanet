//
//  cursoDetalleView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 17/10/22.
//

import SwiftUI

struct cursoDetalleView: View {
    var curso : ModelClases
    @EnvironmentObject var entrar : Usuario_Modelo
    @State var isBaja  = false
    @State var isSure = false
    @State var areYouSure = false
    var body: some View {
        ScrollView{
            VStack(alignment:.center){
                
                VStack(alignment:.center,spacing:40){
                    figura()
                        .overlay{
                            Text("\(curso.nombre)")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                        }
                    
                    TextoJustificado(texto: curso.description)
                    
                        .frame(width:350,height:200)
                        .padding()
                    Text("\(curso.duracion) SEMANAS")
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
                    if(curso.status == "Cursando" || curso.status == "Cursado"){
                    Construyendo_circulo(incremento: curso.id)
                        .frame(width: 200  , height: 200, alignment: .center)
                    }
                    
                    
                    //                    MARK: -Boton por si se dio de baja el pana
                               
                    if(curso.status == "Cursando"){
                                            Button{
                                                areYouSure.toggle()
                                                if isSure{
                                                Task{
                                                    let res = await entrar.dar_de_baja(token: entrar.x_token)
                                                    isBaja = res
                                                }
                                                }
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
                    
                    
                    
                    
                }.frame(maxHeight: .infinity)
                    .padding()
                
            }
            .alert(isPresented: $isBaja){
                Alert(title: Text("Baja Definitiva"), message: Text("La baja se realizado con exito"), dismissButton:.default(Text("Ok")))
 
        }
            .alert(isPresented: $areYouSure) { () -> Alert in
                        let primaryButton = Alert.Button.default(Text("Acepto")) {
                            isSure = true
                        }
                        let secondaryButton = Alert.Button.cancel(Text("Cancelar")) {
                            isSure = false
                        }
                        return Alert(title: Text("Cuidado"), message: Text("Esta accion no se puede des hacer"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                    }
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


struct TextoJustificado: UIViewRepresentable{
    var texto:String
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textAlignment = .justified
        return textView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = texto
    }
}
struct figura:View{
    var body: some View{
        Rectangle()
            .fill(.black)
            .frame(width:350,height:150)
            .offset(x:-25,y:-20)
            .overlay{
                Rectangle()
                    .fill(.black)
                    .frame(width:350,height:150)
                    .offset(x:25,y:20)
            }
    }
}


//struct cursoDetalleView_Previews: PreviewProvider {
//    static var previews: some View {
//        cursoDetalleView()
//    }
//}
}
