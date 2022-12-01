//
//  perfilView.swift
//  PrepaNet
//
//  Created by Alan Jesus Galvan Valles on 09/11/22.
//

import SwiftUI

struct perfilView: View {
    var alumnoModelo = AlumnoGet()
    
    @EnvironmentObject var entrar : Usuario_Modelo
    @State var alumno = AlumnoModelo(nombre: "", apellido: "", matricula: "", campus: "")
    @State var nombre=""
    @State var matricula=""
    @State var edad=""
    @State var isHidden = true
    @State  var isActiveNormal = false
    var body: some View {
        NavigationView{
            VStack(alignment:.center, spacing: 20){
                VStack{
                    Circle()
                        .fill(.black)
                        .frame(width:170,height: 170,alignment: .center)
                    
                        .overlay{
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width:150,height: 150,alignment: .center)
                                .padding()
                                .padding(.top,1)
                                .overlay{
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .opacity(0.9)
                                        .frame(width:50,height:40)
                                }
                        }
                }
                .offset(y:-30)
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                    
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 15, y: 20)
                    
                        .frame(width:200,height:300)
                        .overlay{
                            VStack(alignment:.center,spacing:30){
                                
                                Text("\(alumno.nombre)")
                                    .foregroundColor(.black)
                                    .font(.title)
                                Text("\(alumno.apellido)")
                                    .foregroundColor(.black)
                                    .font(.title)
                                Text("\(alumno.matricula)")
                                    .foregroundColor(.black)
                                    .font(.title)
                                Text("\(alumno.campus)")
                                    .foregroundColor(.black)
                                    .font(.title)
                                
                            }
                            
                            
                            Spacer()
                            Button{
                                entrar.isLogged = false
                                entrar.x_token = ""
                            }label: {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.red)
                                   
                                    .frame(width: 200, height: 50)
                                
                                    .overlay{
                                        Text("Cerrar sesion")
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }
                            }
                            .offset(y:140)
                            .padding(.top,140)
                        }
                        .padding(.bottom,100)
                        .onAppear{
                            Task{
                                let alumnotemporal = await alumnoModelo.loadData(token: entrar.x_token)
                                alumno = alumnotemporal ?? AlumnoModelo(nombre: "", apellido: "", matricula: "", campus: "")
                                
                            }
                        }
                    
                }
                
                
                
            }
            .offset(y:-30)
            //            .offset(y:-20)
            .background{
                Image("imagenUno")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:350,height: 350)
                    .padding(.top,400)
                
            }
            
        }
        
        
        
    }
    
    struct perfilView_Previews: PreviewProvider {
        static var previews: some View {
            perfilView()
        }
    }
    
}
