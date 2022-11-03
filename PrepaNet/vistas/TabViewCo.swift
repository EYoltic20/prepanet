//
//  TabView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 14/10/22.
//

import SwiftUI

struct TabViewCo: View {
    @State var seleccion : String = "Home"
    var body: some View {
        NavigationView{
        TabView{
            
//            MARK: -Dash board
            dashBoardView()
                .tag("dash")
                .tabItem{
                    Image(systemName: "house")
                    
                }
            AlertasView()
                .tag("alerta")
                .tabItem{
                    Image(systemName: "bell.fill")
                }
            calendarioView()
                .tag("Calendar")
                .tabItem {
                    Image(systemName: "calendar")
                }
            
        }.accentColor(.black)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCo()
    }
}
