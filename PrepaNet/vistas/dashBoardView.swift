//
//  dashBoardView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct dashBoardView: View {
    var cursos = ["Ingles", "Aleman"]
    var body: some View {
        NavigationView{
            VStack(alignment:.leading,spacing : 35){
                Text("Cursos Activos")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                //            MARK : -Cursos activos
                HStack{
                    Spacer()
                    ForEach(cursos.indices , id : \.self){ curso in
                        cursoView(curso: cursos[curso])
                            .frame(maxWidth:150,maxHeight: 150)
                    }
                    Spacer()
                    
                }
                Text("Cursos Pasados")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                //            MARK : -Cursos activos
                HStack{
                    Spacer()
                    ForEach(cursos.indices , id : \.self){ curso in
                        cursoView(curso: cursos[curso])
                            .frame(maxWidth:150,maxHeight: 150)
                    }
                    Spacer()
                    
                }
            }
        }
    }
}

struct dashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        dashBoardView()
    }
}
