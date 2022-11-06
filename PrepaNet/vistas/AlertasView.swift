//
//  AlertasView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 21/10/22.
//

import SwiftUI

struct AlertasView: View {
    var alertas = ["Inscripcion disponible","Periodo dado  de baja"]
    var body: some View {
        VStack{
            List{
                ForEach(alertas.indices,id:\.self){alerta in
                    HStack(spacing:10){
                        Image(systemName: "megaphone")
                        
                        Text("\(alertas[alerta])")
                        
                    }
                    .frame(width: .infinity, height: 50)
                    
                }
            }.listStyle(.inset)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AlertasView_Previews: PreviewProvider {
    static var previews: some View {
        AlertasView()
    }
}
