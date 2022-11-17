//
//  dashBoardView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct dashBoardView: View {
    @State private var cursos = [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:" 10 11 2022",periodoFinal: "20 11 2022"),
                                 ClasesModelo(nombre: "Mis habilidades y motivaciones ", calificacion: 0, descripcion: "Reconocimiento de habilidades, destrezas, fortalezas. FODA. GATO ", dar_de_baja: false, estado: false, periodoInicio:" 10 11 2022",periodoFinal: "20 11 2022"),
                                 ClasesModelo(nombre: "Mis emociones ", calificacion: 40, descripcion: "¿Qué son las emociones? Emociones, biología de la salud. Importancia de las emociones. Identificación de emociones. Tipos de emociones. Inteligencia emocional. ", dar_de_baja: false, estado: false, periodoInicio:" 10 11 2022",periodoFinal: "20 11 2022"),
                                 ClasesModelo(nombre: "Mis relaciones ", calificacion: 70, descripcion: "Desarrollo de empatía. (Competencias emocionales e interpersonales). Tipos de relaciones. Aspectos importantes en las relaciones. Límites personales. Mis relaciones interpersonales. Mapa de mis relaciones. ", dar_de_baja: false, estado: false,periodoInicio:" 10 11 2022",periodoFinal: "20 11 2022"),
                                 ClasesModelo(nombre: "Mis áreas de oportunidad ", calificacion: 80, descripcion: "Metamomento. Expresión de emociones. Posiciones ante la comunicación de emociones. La inteligencia emocional y la comunicación asertiva. Regulación de emociones. Desarrollo de resolución de conflictos (El plano inteligente-emocional) ", dar_de_baja: false, estado: false, periodoInicio:" 10 11 2022",periodoFinal: "20 11 2022")
    ]
    @State var cursosInactivos = [ClasesModelo]()
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
                            .fill(.green)
                            .frame(width:250,height:200)
                            .shadow(color:.black.opacity(0.4), radius: 10, x: 15, y: 15)
                            .overlay{
                                Text(getCurso())
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.title)
                                
                            }
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
                                ForEach(cursosInactivos.indices , id : \.self){ curso in
                                    NavigationLink(destination:cursoDetalleView(curso: cursosInactivos[curso])){
                                        
                                        cursoView(curso: cursosInactivos[curso].nombre,colo:Color.black)
                                        
                                            .frame(width:150,height: 150)
                                            .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                        //                                Capsula de calificacion
                                            .overlay{
                                                Capsule()
                                                    .fill(cursosInactivos[curso].calificacion < 70 ? .red : .green)
                                                
                                                    .opacity(0.6)
                                                    .overlay{
                                                        Text("\(cursosInactivos[curso].calificacion)%")
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
                    //                    MARK: -Curso faltantes
                    VStack(alignment:.leading , spacing: 35){
                        Text("Cursos Faltantes")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                        
                        
                        ScrollView(.horizontal){
                            
                            LazyHGrid(rows:rowsGrid,spacing: 20){
                                Spacer()
                                ForEach(cursosInactivos.indices , id : \.self){ curso in
                                    NavigationLink(destination:cursoDetalleView(curso: cursosInactivos[curso])){
                                        
                                        cursoView(curso: cursosInactivos[curso].nombre,colo:Color.blue)
                                            .frame(width:150,height: 150)
                                        
                                            .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                        //                                Capsula de calificacion
                                            .overlay{
                                                Capsule()
                                                    .fill(cursosInactivos[curso].calificacion < 70 ? .red : .green)
                                                
                                                    .opacity(0.6)
                                                    .overlay{
                                                        Text("\(cursosInactivos[curso].calificacion)%")
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
                                NavigationLink(destination: InscripcionesView()){
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width:20,height: 20)
                                }
                                
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
                        //                MARK: -Perfil
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
                        //              MARK: -Menu
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
                        .background{
                            animacion(url: "https://assets10.lottiefiles.com/packages/lf20_nwfrjcrb.json")
                                .frame(maxWidth:.infinity,maxHeight: .infinity)
                                .ignoresSafeArea()
                                
                        }
            .onAppear{
                cursosInactivos = getCursosInactivos()
            }
        }
        
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
    
    
    
    //    MARK: -Obtener el curso activo
    func getCurso()->String{
        for curso in cursos{
            if(curso.estado){
                return curso.nombre
            }
        }
        return "error"
    }
    //    MARK: -Obtener curso inactivo
    func getCursosInactivos() ->[ClasesModelo]{
        var t=[ClasesModelo]()
        for curso in cursos {
            if curso.estado == false{
                t.append(curso)
            }
        }
        return t
    }
}

struct dashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        dashBoardView()
    }
}
