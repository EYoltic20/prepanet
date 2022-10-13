//
//  dashBoardView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct dashBoardView: View {
    var cursos = ["Ingles", "Aleman","Matematicas","Geografia"]
    let rowsGrid = [GridItem(.flexible(minimum:3))]
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment:.leading,spacing : 35){
                    Text("Cursos Activos")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    //            MARK: -Cursos activos
                    ScrollView(.horizontal){
                        LazyHGrid(rows:rowsGrid,spacing: 20){
                            Spacer()
                            ForEach(cursos.indices , id : \.self){ curso in
                                cursoView(curso: cursos[curso])
                                    .frame(width:150,height: 150)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                            }
                            
                            Spacer()
                        }
                    }
                    .frame(height: 160)
                    
                    Text("Cursos Pasados")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    //            MARK: -Cursos inactivos
                    ScrollView(.horizontal){
                        LazyHGrid(rows:rowsGrid,spacing: 20){
                            Spacer()
                            ForEach(cursos.indices , id : \.self){ curso in
                                cursoView(curso: cursos[curso])
                                    .frame(width:150,height: 150)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                            }
                            
                            
                        }
                    }.frame(height:160)
                    
                }.padding()
                
                Spacer()
                //            MARK: -informacionde regristo
                VStack(alignment:.center){
                    Text("Inscripciones Dispoibles")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(" 20 de marzo del 2022")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Circle()
                        .fill(.gray)
                        .opacity(0.2)
                        .overlay{
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width:20,height: 20)
                        }
                        .frame(width:50,height: 50,alignment: .center)
                        
                }
            }
//            MARK: -parte de arriba
            .toolbar{
//                Logo
                ToolbarItem(placement:.principal){
                                Image("LOGO")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:130,height: 30)
                }
//                Perfil
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                       print("Hola")
                    }label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width:30,height: 30)
                    }
                }
//                Menu
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                       print("Hola")
                    }label: {
                        Image(systemName: "text.justify")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width:30,height: 30)
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .navigationTitle{

//        }
    }
}

struct dashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        dashBoardView()
    }
}
