//
//  InscripcionesView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/11/22.
//

import SwiftUI
import Lottie
struct InscripcionesView: View {
    var modelo  = Inscribir()
    @State var codigo = 0
    @State var curso_A_Inscribir = modeloinscripcion(description: "", duracion: 0, id: 0, nombre: "", orden: 0)
    @EnvironmentObject var entrar : Usuario_Modelo
    @State var alerta = false
    @State var alerta_error = false
    @State var anima = false
    var body: some View {
        
        ZStack{
//            if(!(curso_A_Inscribir.description == "") || codigo == 0  ){
//
//
//                animacion(url: "https://assets1.lottiefiles.com/packages/lf20_y5ljuke8.json").frame(width:400,height:400)
//            }
            if anima{
                animacion(url: "https://assets10.lottiefiles.com/packages/lf20_nxsyeqbd.json")
                    .frame(maxWidth:.infinity,maxHeight: .infinity)

            }
            if(curso_A_Inscribir.description == "" || codigo == 400){
                VStack{
                Image("no_inscripciones").resizable()
                
                    .frame(width:200,height:300)
                Text("No hay cursos proximos a inscripcion")
                    .font(.title)
                    .fontWeight(.bold)
                }                .alert(isPresented: $alerta){
                    Alert(title: Text("Inscripcion existosa"), message: Text("La inscripcion se llevo acabo correctamente"), dismissButton:.default(Text("Ok")))
                }
            }
            else{
                VStack(spacing:70){
                    
                    Text("Proximo curso disponible")
                        .font(.title)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    //            MARK: -Construccioon del cuadro del curso
                    Image(regresar_nombre(nombre: curso_A_Inscribir.nombre))
                        .resizable()
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
                                    Text(curso_A_Inscribir.nombre)
                                        .font(.title3)
                                        .bold()
                                    
                                }
                                .padding(.top,59.5)
                        }
                    
                    
                    Button{
                        Task{
                            let res = await modelo.inscribir(id:curso_A_Inscribir.id,token: entrar.x_token)
                            codigo = res
                            if(codigo == 400){
                                alerta=true
                                anima.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                                    anima = false
                                }
                            }else{
                                codigo = 0
                                alerta_error.toggle()
                                
                            }
                        }
                        
                    }label:{
                        Rectangle()
                            .fill(.green)
                            .cornerRadius(10)
                            .frame(width:200,height: 80)
                            .overlay{
                                Text("Inscribir").foregroundColor(.white)
                            }
                    }
                    
                }

                .alert(isPresented: $alerta_error){
                    Alert(title: Text("Error"), message: Text("Hubo un error en la inscripcion"), dismissButton:.default(Text("Ok")))
                }
                .padding()
            }
        }
        
        .onAppear{
            Task{
                let res = await modelo.gettingData(token: entrar.x_token)
                curso_A_Inscribir = res ?? modeloinscripcion(description: "", duracion: 0, id: 0, nombre: "", orden: 0)
            }
        }
   


    }
    
    
}



struct InscripcionesView_Previews: PreviewProvider {
    static var previews: some View {
        InscripcionesView()
    }
}
