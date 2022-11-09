//
//  calendarioView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 21/10/22.
//

import SwiftUI

import SwiftUICalendar
// Se implemento el pod SwiftUICalendar

struct calendarioView: View {
    
    //    var informations = [YearMonthDay: [(String, Color)]]()
    @State var nota = ""
    @State var alerta = false
    @State var fecha : YearMonthDay  = YearMonthDay.current
    @State var notaAdd = false
    @ObservedObject var infoview  = informationView(cursos: [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:"10 11 2022",periodoFinal: "20 11 2022")
                                                            ])
    @ObservedObject var controller: CalendarController = CalendarController()
    var body: some View {
        NavigationView{
        GeometryReader{reader in
            
            VStack{
                HStack{
                    //                    MARK: -Back Button
                    Button{
                        controller.scrollTo(controller.yearMonth.addMonth(value: -1), isAnimate: true)
                    }label: {
                        Image(systemName: "arrow.left")
                    }.padding(8)
                    Spacer()
                    //                    MARK: -Fecha
                    Text("\(controller.yearMonth.monthShortString)  \(String(controller.yearMonth.year))")
                        .font(.title)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    Spacer()
                    // MARK: -Follow button
                    Button{
                        controller.scrollTo(controller.yearMonth.addMonth(value: 1), isAnimate: true)
                    }label: {
                        Image(systemName: "arrow.right")
                    }.padding(8)
                    
                }
            }.padding()
            Spacer()
            CalendarView(controller,header: {week in
                GeometryReader{geometry in
                    Text(week.shortString)
                        .font(.subheadline)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                }
            },component: {date in
                GeometryReader{geometry in
                    VStack(alignment: .leading, spacing: 2){
                        //                        MARK: -Mostrar el dia actual
                        if date.isToday{
                            Text("\(date.day)")
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .padding(4)
                                .foregroundColor(.white)
                                .background(Color.red.opacity(0.95))
                                .cornerRadius(14)
                                .onTapGesture {
                                    notaAdd = true
                                    fecha = date
                                }
                            //                    MARK: -Mostrar fecha de cursos
                        }else if(infoview.informations.contains(date)){
                            
                            Text("\(date.day)")
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                .onTapGesture {
                                    notaAdd = true
                                    fecha = date
                                }
                            rectangulo(geometry: geometry, color: Color.blue)
                                .cornerRadius(30)
                            
                        }
                        else{
                            Text("\(date.day)")
                                .font(.system(size: 15, weight: .bold, design: .default))
                            
                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                .onTapGesture {
                                    notaAdd = true
                                    fecha = date
                                }
                        }
                        //                        MARK: -Mostrar las tareas
                        if let info = infoview.guardarInfo[date]{
                            ForEach(info.indices,id:\.self){ tareas in
                                rectangulo(geometry: geometry, color: Color.green)
                                    .cornerRadius(30)
                            }
                        }
                        
                        //                        MARK: -Mostrar todos los cursos
                        
                        
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                }
            }).padding(.top,60)
                .padding(.all,20)
            
            ZStack{
                agregar_nota(date:fecha)
                    .frame(maxWidth:.infinity,maxHeight:reader.size.height/4, alignment: .bottom)
                
                    .offset(y:notaAdd ? 500 : 2000)
                    .animation(.easeIn(duration: 0.4))
                
            }
            
        }
        .onAppear{
            infoview.recover(cursos: [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:"10 11 2022",periodoFinal: "20 11 2022")])
            infoview.get_values()
            
            print(infoview.informations)
        }
        .padding()
                .alert(isPresented: $alerta){
            Alert(title: Text("Demasiadas Tares"), message: Text("Ya son demasiadas tareas"), dismissButton:.default(Text("Ok")))
        }
            
        }
        
    }
    
    //    MARK: -Agregar nueva nota
    @ViewBuilder
    func agregar_nota(date:YearMonthDay)-> some View{
        //        MARK: -Nota circulo
        VStack(alignment:.center,spacing: 0){
            
            HStack{
                Text("Tareas")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button{
                    notaAdd = false
                }label:{
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width:30,height:30)
                }
            }
            .frame(maxWidth:.infinity)
            .padding()
            
            //            MARK: -Mostrar tareas
            
            VStack(alignment:.leading){
                
                if let info = infoview.guardarInfo[date]{
                    List{
                        ForEach(info.indices,id:\.self){ tareas in
                            HStack(spacing:20){
                                Circle()
                                    .fill(.green)
                                    .frame(width:20,height:20)
                                
                                Text(info[tareas]).foregroundColor(.black)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding()
                            .frame(width:500)
                            
                        }
                        //                    MARK: -Borrar
                        .onDelete(perform: self.deleteRow)
                        .animation(.easeInOut)
                    }
                    .listStyle(.inset)
//
                }
                
            }.frame(width: .infinity, height: 230)
                .padding()
            //                .padding(.top,100)
            
            //            Mark: -Ingresar valores
            HStack{
                Spacer()
                TextField("Escribe una tarea",text: $nota)
                    .frame(height:200)
                    .overlay{
                        VStack{
                            
                            Divider().frame(maxWidth:200,alignment: .bottom)
                                .padding(.top,20)
                        }
                    }
                Spacer()
                Button{
                    
                    cuantasTareasHay(date: date)
                    print("into_guarda")
                }label: {
                    Image(systemName: "plus")
                }
            }
            .frame(maxWidth:300)
            .padding()
            //            .padding(.bottom,50)
        }.padding(.top,50)
        //        .frame(maxWidth:.infinity,maxHeight: 400,alignment: .center)
            .background{
                Color.white
                    .shadow(color: .black.opacity(0.4), radius: 10, x: 15, y: 10)
                
            }
    }
    
    // MARK: -Generador de rectangulos
    
    @ViewBuilder
    func rectangulo(geometry:GeometryProxy,color:Color)->some View{
        Rectangle().fill(color)
            .frame(width: geometry.size.width, height: geometry.size.height/8,alignment: .center)
            .cornerRadius(10)
        
    }
    func cuantasTareasHay(date:YearMonthDay){
        if ((infoview.guardarInfo[date]?.count ?? 0)>3 ){
            alerta = true
        }else{
            infoview.insertar_text(texto: nota, fecha: date)
        }
    }
//    MARK: -Borar tareas
    private func deleteRow(at indexSet: IndexSet) {
        self.infoview.guardarInfo[fecha]!.remove(atOffsets: indexSet)
    }
    
}

struct calendarioView_Previews: PreviewProvider {
    static var previews: some View {
        calendarioView()
    }
}
