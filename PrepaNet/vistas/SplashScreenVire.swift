//
//  SplashScreenVire.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 15/11/22.
//

import SwiftUI

struct SplashScreenVire: View {
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            ContentView()
        }else{
            
            
            
            VStack{
                VStack{
                    Image("LOGO")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250, alignment: .center)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.opacity = 1
                        self.size=0.9
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
                    self.isActive = true
                }
            }
            
        }
    }
}

struct SplashScreenVire_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenVire()
    }
}
