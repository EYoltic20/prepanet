//
//  AlertasView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 21/10/22.
//

import SwiftUI

struct AlertasView: View {
    var alertas = ["Inscripcion disponible","Darse de baja"]
    var body: some View {
        VStack{
            List{
                ForEach(alertas.indices,id:\.self){alerta in
                    Text("\(alertas[alerta])")
                }
            }
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
