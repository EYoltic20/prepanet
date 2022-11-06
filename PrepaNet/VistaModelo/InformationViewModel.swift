//
//  InformationViewModel.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 02/11/22.
//

import Foundation
import SwiftUICalendar

extension YearMonthDay: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.year)
        hasher.combine(self.month)
        hasher.combine(self.day)
    }
}
class informationView:ObservableObject{
    @Published var informations:[YearMonthDay] = []
    @Published var guardarInfo : [YearMonthDay:[String]] =  [:]
    
    var cursos : [ClasesModelo]
    var split_curso_I : [String] = []
    var split_curso_F : [String] = []
    init(cursos:[ClasesModelo]){
        self.cursos = cursos
        print(cursos[0].periodoFinal)
        print(YearMonthDay.current)

        
//        MARK: -Acomodando las fechas
       
    }
    func recover(cursos:[ClasesModelo]){
        self.cursos = cursos
    }
    func insertar_text(texto:String,fecha:YearMonthDay){
        if guardarInfo[fecha] == nil{
            guardarInfo[fecha] = []
            guardarInfo[fecha]?.append(texto)
        }else{
            if guardarInfo[fecha]!.count>3{
                print("Ya hay Muchas Tareas")
            }
            guardarInfo[fecha]?.append(texto)
            print(guardarInfo)
        }
        
   
    }
    func get_values(){
        for curso in cursos {
            let fecha_Inicio=String(curso.periodoInicio)
            let fecha_Final = String(curso.periodoFinal)
            
            split_curso_I = fecha_Inicio.split(separator:" ").map { String($0) }
            split_curso_F = fecha_Final.split(separator:" ").map { String($0) }
            let diferencias = Int(split_curso_I[0])!-Int(split_curso_F[0])!
            for i in 0...abs(diferencias-1){
                let date = YearMonthDay(
                    year:Int(split_curso_I[2])!,
                    month: Int(split_curso_I[1])!,
                    day:(Int(split_curso_I[0])!+i)
                )
                informations.append(date)
                
            }
        }
    }
    

}
//struct InformationView{
//    var InformationView
//    
//}


//struct InformationView {
//    var informations = [YearMonthDay: [(String, Color)]]()
//
//    init() {
//        var date = YearMonthDay.current
//        informations[date] = []
//        informations[date]?.append(("Hello", Color.orange))
//        informations[date]?.append(("World", Color.blue))
//
//        date = date.addDay(value: 3)
//        informations[date] = []
//        informations[date]?.append(("Test", Color.pink))
//
//        date = date.addDay(value: 8)
//        informations[date] = []
//        informations[date]?.append(("Jack", Color.green))
//
//        date = date.addDay(value: 5)
//        informations[date] = []
//        informations[date]?.append(("Home", Color.red))
//
//        date = date.addDay(value: -23)
//        informations[date] = []
//        informations[date]?.append(("Meet at 8, Home", Color.purple))
//
//        date = date.addDay(value: -5)
//        informations[date] = []
//        informations[date]?.append(("Home", Color.yellow))
//
//        date = date.addDay(value: -10)
//        informations[date] = []
//        informations[date]?.append(("Baseball", Color.green))
//    }
