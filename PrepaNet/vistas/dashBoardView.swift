//
//  dashBoardView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct dashBoardView: View {
    @State var cursos = [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,perdiodo: "Enero – Abril 2022"),
                         ClasesModelo(nombre: "Mis habilidades y motivaciones ", calificacion: 0, descripcion: "Reconocimiento de habilidades, destrezas, fortalezas. FODA. GATO ", dar_de_baja: false, estado: false, perdiodo: "Mayo – Agosto 2022"),
                         ClasesModelo(nombre: "Mis emociones ", calificacion: 40, descripcion: "¿Qué son las emociones? Emociones, biología de la salud. Importancia de las emociones. Identificación de emociones. Tipos de emociones. Inteligencia emocional. ", dar_de_baja: false, estado: false, perdiodo: "Sep – Diciembre 2022"),
                         ClasesModelo(nombre: "Mis relaciones ", calificacion: 70, descripcion: "Desarrollo de empatía. (Competencias emocionales e interpersonales). Tipos de relaciones. Aspectos importantes en las relaciones. Límites personales. Mis relaciones interpersonales. Mapa de mis relaciones. ", dar_de_baja: false, estado: false, perdiodo: "Sep – Diciembre 2022"),
                         ClasesModelo(nombre: "Mis áreas de oportunidad ", calificacion: 80, descripcion: "Metamomento. Expresión de emociones. Posiciones ante la comunicación de emociones. La inteligencia emocional y la comunicación asertiva. Regulación de emociones. Desarrollo de resolución de conflictos (El plano inteligente-emocional) ", dar_de_baja: false, estado: false, perdiodo: "Sep – Diciembre 2022")
    ]
    let rowsGrid = [GridItem(.flexible(minimum:3))]
    @State var isDetalleViewActive = false
    @State var otroCursos = false
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    //                MARK: -curso activo
                    VStack(alignment:.center){
                        ZStack{
                        NavigationLink(destination:cursoDetalleView(curso: cursos[0]),isActive: $isDetalleViewActive,label: {EmptyView()})
                        }
                        Text("Curso Actual")
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                            .font(.title)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(width:250,height:200)
                            .overlay{
                                Text("\(cursos[0].nombre)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .shadow(color:.black.opacity(0.4), radius: 10, x: 15, y: 15)
                            .onTapGesture {
                                isDetalleViewActive.toggle()
                            }
                    }
                    VStack(alignment:.leading,spacing : 35){
                        Text("Cursos Pasados")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                        
                        //            MARK: -Cursos inactivos
                        ScrollView(.horizontal){
                            
                            LazyHGrid(rows:rowsGrid,spacing: 20){
                                Spacer()
                                ForEach(cursos.indices , id : \.self){ curso in
                                    NavigationLink(destination:cursoDetalleView(curso: cursos[curso])){
                                    
                                    cursoView(curso: cursos[curso].nombre)
                                        .frame(width:150,height: 150)
                                        .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                    //                                Capsula de calificacion
                                        .overlay{
                                            Capsule()
                                                .fill(cursos[curso].calificacion < 70 ? .red : .green)
                                            
                                                .opacity(0.6)
                                                .overlay{
                                                    Text("\(cursos[curso].calificacion)%")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    //                                .for
                                                    //                            poner cambio de color
                                                }
                                                .offset(x:45,y:-57)
                                                .shadow(color:.black.opacity(0.7), radius: 10, x: 5, y: 5)
                                                .frame(width:50,height:30)
                                        }
                                        }

                                    
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
                }.frame(maxWidth:.infinity,maxHeight: .infinity)
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
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        //        .navigationTitle{
        
        //        }
    }
}

struct dashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        dashBoardView()
    }
}
