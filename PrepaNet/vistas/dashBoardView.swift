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
    @State var cursosPasados = [ModelClases]()
    @State var cursosActivos = [ModelClases]()
    @EnvironmentObject var entrar : Usuario_Modelo
    let rowsGrid = [GridItem(.flexible(minimum:3))]
    @State var isDetalleViewActive = false
    @State var otroCursos = false
    @State var cursoActual  = ""
    @State var isPerfilActive = false
    @State var abrirMeniu = false
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack{
                    VStack{
                        //                MARK: -curso activo
                        VStack(alignment:.center){
                            //                        MARK: - Navegacion dentro
                            ZStack{
                                NavigationLink(destination:cursoDetalleView(curso: getCurso() ?? ModelClases(id: 0, nombre: "xx", orden: 1, description: "aa", duracion: 1, approved: true, status: "")),isActive: $isDetalleViewActive,label: {EmptyView()})
                                NavigationLink(destination:perfilView(),isActive:$isPerfilActive,label:{EmptyView()})
                            }
                            Text("Curso Actual")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .font(.title)
                            if (cursosActivos.count < 1){
                                Image("imagen_perro")
                                    .resizable()
                                    .frame(width:100,height:200)
                                Text("No hay cursos activos")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                            }
                            else{
                                
                                Image(regresar_nombre(nombre: cursosActivos[0].nombre))
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:250,height:200)
                                    .shadow(color:.black.opacity(0.4), radius: 10, x: 15, y: 15)
                                    .overlay{
                                        VStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.green)
                                                .frame(width:250,height:70)
                                                .overlay{
                                                    Text(getCursoNombre())
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.black)
                                                        .font(.body)
                                                }
                                        }.offset(y:60)
                                    }
                                    .onTapGesture {
                                        isDetalleViewActive.toggle()
                                    }
                            }
                        }
                        VStack(alignment:.leading,spacing : 35){
                            Text("Cursos Faltantes")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding()
                            
                            //            MARK: -Cursos Faltantes
                            ScrollView(.horizontal){
                                
                                HStack(spacing:20){
                                    Spacer()
                                    ForEach(cursosInactivos.indices , id : \.self){ curso in
                                        NavigationLink(destination:cursoDetalleView(curso: cursosInactivos[curso])){
                                            
                                            cursoView(curso: cursosInactivos[curso].nombre,colo:Color.black)
                                            
                                                .frame(width:150,height: 150)
                                                .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                            //                                Capsula de calificacion
                                            
                                        }
                                        
                                        
//                                    }
                                    
                                    
                                    
                                }
                                }
                            }.frame(height:160)
                            
                        }.padding()
                        //                    MARK: -Curso Pasados
                        VStack(alignment:.leading , spacing: 35){
                            Text("Cursos Pasados")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding()
                            
                            
                            ScrollView(.horizontal){
                                
                                LazyHGrid(rows:rowsGrid,spacing: 20){
                                    Spacer()
                                    ForEach(cursosPasados.indices, id : \.self){ curso in
                                        NavigationLink(destination:cursoDetalleView(curso: cursosPasados[curso])){
                                            
                                            cursoView(curso: cursosPasados[curso].nombre,colo:Color.blue)
                                                .frame(width:150,height: 150)
                                            
                                                .shadow(color: .black.opacity(0.3), radius: 10, x: 4, y: 3)
                                            //                                Capsula de calificacion
                                                .overlay{
                                                    Capsule()
                                                        .fill(cursosPasados[curso].approved ? .green : .red)
                                                    
                                                        .opacity(0.6)
                                                        .overlay{
                                                            Text("\(cursosPasados[curso].status)")
                                                                .font(.caption)
                                                                .fontWeight(.bold)
                                                                .foregroundColor(.white)
                                                            //                                .for
                                                            //      x                      poner cambio de color
                                                        }
                                                        .offset(x:45,y:-40)
                                                        .shadow(color:.black.opacity(0.7), radius: 10, x: 5, y: 5)
                                                        .frame(width:70,height:30)
                                                }
                                        }
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                            }.frame(height:160)
                            
                        }.padding()
                        
                        Spacer()
                        //            MARK: -informacionde regristo
                        VStack(alignment:.center){
                            Text("Inscripciones")
                                .font(.title2)
                                .fontWeight(.bold)
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
                            

                            //              MARK: -Perfil
                            ToolbarItem(placement:.navigationBarTrailing){
                                Button{
                                    isPerfilActive.toggle()
                                }label: {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .scaledToFit()
                                        .frame(width:30,height: 30)
                                }
                                
                            }
                        }
                    
                }
                .background{
                    //                animacion(url: "https://assets10.lottiefiles.com/packages/lf20_nwfrjcrb.json")
                    //                    .frame(maxWidth:.infinity,maxHeight: .infinity)
                    //                    .ignoresSafeArea()
                    
                }
                .onAppear(){
                        Task{
                            let (cursA,curI,cursD) = await cursos.loadData(url: "https://prepnet.uc.r.appspot.com/api/alumnos/historial-cursos/", token: entrar.x_token) ?? ([],[],[])
                            cursosInactivos=curI
                            cursosActivos = cursA
                            cursosPasados = cursD
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
    
    
    func openMenu(){
        self.abrirMeniu.toggle()
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
