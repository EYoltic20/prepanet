//
//  TabView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 14/10/22.
//

import SwiftUI
struct Comprobar : View{
    @EnvironmentObject var entrar : Usuario_Modelo
    var body: some View{
        if entrar.isLogged{
            TabViewCo()
        }else{
            ContentView()
        }
    }
}


struct TabViewCo: View {
    @State var seleccion : String = "dash"
    var body: some View {
        GeometryReader{geoRoot in
            NavigationView{
                
                TabView(selection: $seleccion){
                    
                    //            MARK: -Dash board
                    dashBoardView()
                        .frame(width:geoRoot.size.width,height: geoRoot.size.height*1.01)
                        .tag("dash")
                        .tabItem{
                            Image(systemName: "house")
                            
                        }
                    AlertasView()
                        .frame(width:geoRoot.size.width,height: geoRoot.size.height*1.1)
                        .tag("alerta")
                        .tabItem{
                            Image(systemName: "bell.fill")
                        }
                    calendarioView()
                        .frame(width:geoRoot.size.width,height: geoRoot.size.height*1.4)
                        .tag("Calendar")
                        .tabItem {
                            Image(systemName: "calendar")
                            
                            
                        }.accentColor(.black)
                }
                
                
                
            }
            .navigationViewStyle(.stack)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
//



struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCo()
    }
}
