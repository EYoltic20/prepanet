//
//  welcomView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 07/10/22.
//

import SwiftUI

struct welcomView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination:dashBoardView(),label:{
                Text("Bienveido AXXXX")
                
            })
            .navigationBarBackButtonHidden(true)
    }
    }
    
}

struct welcomView_Previews: PreviewProvider {
    static var previews: some View {
        welcomView()
    }
}
