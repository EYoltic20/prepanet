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
    @State var notaAdd = false
    @ObservedObject var infoview  = informationView(cursos: [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:"10 11 2022",periodoFinal: "20 11 2022")
                                                            ])
    @ObservedObject var controller: CalendarController = CalendarController()
    var body: some View {
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
                            //                    MARK: -Mostrar fecha de cursos
                        }else if(infoview.informations.contains(date)){
                            
                            Text("\(date.day)")
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                .onTapGesture {
                                    notaAdd = true
                                }
                            rectangulo(geometry: geometry, color: Color.blue)
                                .cornerRadius(30)
                            
                        }
                        else{
                            Text("\(date.day)")
                                .font(.system(size: 15, weight: .bold, design: .default))
                            
                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                        }
                        
                        
                        //                        MARK: -Mostrar todos los cursos
                        
                        
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                }
            }).padding(.top,60)
                .padding(.all,20)
            
            ZStack{
                agregar_nota().frame(maxWidth:reader.size.width,maxHeight:reader.size.height, alignment: .bottom)
                    .frame(maxHeight:.infinity,alignment: .bottom)
                    .offset(y:notaAdd ? 0 : 800)

            }
            
        }
        .onAppear{
            infoview.recover(cursos: [ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:"10 11 2022",periodoFinal: "20 11 2022")])
            infoview.get_values()
            
            print(infoview.informations)
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
//    MARK: -Agregar nueva nota
@ViewBuilder
    func agregar_nota()-> some View{
    
        VStack(alignment:.center){
                HStack{
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
                Spacer()
                HStack{
                    Spacer()
                    TextField("Escribe una tarea",text: $nota)
                        .frame(height:200)
                        .overlay{
                            VStack{
                                
                                Divider().frame(maxWidth:300,alignment: .bottom)
                                    .padding(.top,20)
                            }
                        }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                .frame(maxWidth:300)
                .padding()
            }
            .padding()
            .frame(maxWidth:.infinity,maxHeight: 300,alignment: .center)
            .background{
                Color.white
                    .shadow(color: .black, radius: 10, x: 1, y: 10)
                
            }
    }
// MARK: -Generador de rectangulos
    
@ViewBuilder
    func rectangulo(geometry:GeometryProxy,color:Color)->some View{
        Rectangle().fill(.blue)
            .frame(width: geometry.size.width, height: geometry.size.height/8,alignment: .center)
            .cornerRadius(10)
            
    }
    
}

struct calendarioView_Previews: PreviewProvider {
    static var previews: some View {
        calendarioView()
    }
}
