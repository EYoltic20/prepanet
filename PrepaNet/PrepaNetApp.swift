//
//  PrepaNetApp.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 30/09/22.
//

import SwiftUI

@main
struct PrepaNetApp: App {
    var shared = informationView(cursos:[ClasesModelo(nombre: "Liderazgo Positivo y Transformación Personal ", calificacion: 100, descripcion: "Transformar su vida y aumentar tu riqueza y capital psicológico, con el fin de tener mayor éxito estudiantil, lograr una mayor influencia en su contexto y cambiar el entorno. ", dar_de_baja: false, estado: true,periodoInicio:"10 10 2022",periodoFinal: "20 10 2022")])
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(shared)
        }
    }
}
