//
//  PrepaNetApp.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 30/09/22.
//

import SwiftUI

@main
struct PrepaNetApp: App {
    var shared = ClasesModelo()
    var body: some Scene { 
        WindowGroup {
            ContentView()
                .environmentObject(shared)
        }
    }
}
