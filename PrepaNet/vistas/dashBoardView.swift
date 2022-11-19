//
//  dashBoardView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct dashBoardView: View {
    @ObservedObject var cursos  =  ClasesModelo()
    @State var cursosInactivos = [ModelClases]()
    @State var cursosActivos = [ModelClases]()
    
    let rowsGrid = [GridItem(.flexible(minimum:3))]
    @State var isDetalleViewActive = false
    @State var otroCursos = false
    @State var cursoActual  = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    //                MARK: -curso activo
                    VStack(alignment:.center){
                        ZStack{
                            NavigationLink(destination:cursoDetalleView(curso: getCurso() ?? ModelClases(id: 0, nombre: "xx", orden: 1, description: "aa", duracion: 1, approved: true, status: "")),isActive: $isDetalleViewActive,label: {EmptyView()})
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
                                Text(getCursoNombre())
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
                                                    .fill(cursosInactivos[curso].id < 70 ? .red : .green)
                                                
                                                    .opacity(0.6)
                                                    .overlay{
                                                        Text("\(cursosInactivos[curso].id)%")
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
                                ForEach(cursosInactivos.indices, id : \.self){ curso in
                                    NavigationLink(destination:cursoDetalleView(curso: cursosInactivos[curso])){
                                        
                                        cursoView(curso: cursosInactivos[curso].nombre,colo:Color.blue)
                                            .frame(width:150,height: 150)
                                        
                                            .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                        //                                Capsula de calificacion
                                            .overlay{
                                                Capsule()
                                                    .fill(cursosInactivos[curso].id < 70 ? .red : .green)
                                                
                                                    .opacity(0.6)
                                                    .overlay{
                                                        Text("\(cursosInactivos[curso].id)%")
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
            .onAppear(){
                DispatchQueue.main.async {
                    
                    Task{
                        let (cursA,curI) = await cursos.loadData(url: "https://prepnet.uc.r.appspot.com/api/alumnos/historial-cursos/")
                        cursosInactivos=curI
                        cursosActivos = cursA
                        //                sleep(2)
                        //                print(cursos.result)
                        //                print(cursos.cursosInactivos)
                        //                cursosInactivos = cursos.cursosInactivos
                    }
                }
            }
            
        }
        
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
    
    
    
    //    MARK: -Obtener el curso activo
    func getCursoNombre()->String{
        for curso in cursosActivos{
            if(curso.status == "Cursando"){
                return curso.nombre
            }
        }
        return "error"
    }
    
    func getCurso()->ModelClases?{
        for curso in cursosActivos{
            if(curso.status == "Cursando"){
                return curso
            }
        }
        return nil
    }
    
    //    MARK: -Obtener curso inactivo
    func getCursosInactivos()  ->[ModelClases]{
        var t=[ModelClases]()
        for curso in cursos.result {
            if curso.status == "Sin Cursar"{
                t.append(ModelClases(id: curso.id, nombre: curso.nombre, orden: curso.orden, description: curso.description, duracion: curso.duracion, approved: curso.approved, status: curso.status))
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
