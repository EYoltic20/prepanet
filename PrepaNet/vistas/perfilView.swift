//
//  perfilView.swift
//  PrepaNet
//
//  Created by Alan Jesus Galvan Valles on 09/11/22.
//

import SwiftUI

struct perfilView: View {
    var alumnoModelo = AlumnoGet()
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
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
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
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10).opacity(0.6)
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 15, y: 20)
                    VStack(alignment:.center,spacing:30){
                        
                        Text("\(alumno.nombre)")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("\(alumno.apellido)")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("\(alumno.matricula)")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("\(alumno.campus)")
                            .foregroundColor(.white)
                            .font(.title)
                        
                    }
                }.frame(width:200,height:300)
                Spacer()
            }
            .padding(.bottom,100)
            .onAppear{
                Task{
                    let alumnotemporal = await alumnoModelo.loadData()
                    alumno = alumnotemporal ?? AlumnoModelo(nombre: "", apellido: "", matricula: "", campus: "")
                    
                }
            }
            .background{
                Image("backgrounf_fondo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -50)
                    
                    
            }
            
            
        }
        
    }
    
    
}

struct perfilView_Previews: PreviewProvider {
    static var previews: some View {
        perfilView()
    }
}

