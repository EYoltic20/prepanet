//
//  lateralView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 28/11/22.
//

import SwiftUI

struct lateralView: View {
    var alumnoModelo = AlumnoGet()
    @State var alumno = AlumnoModelo(nombre: "", apellido: "", matricula: "", campus: "")
    var body: some View {
        NavigationView{
        List{
            HStack{
                Image(systemName:"person.crop.circle")
                    .foregroundColor(.black)
                
                Text(alumno.nombre)
            }
            HStack{
                Image(systemName: "iphone.and.arrow.forward")
                    .foregroundColor(.red)
                Text("Cerrar Sesion")
                    .foregroundColor(.red)
                
            }
        }
        .listStyle(.inset)
        .onAppear{
            
            Task{
                let alumnotemporal = await alumnoModelo.loadData()
                alumno = alumnotemporal ?? AlumnoModelo(nombre: "", apellido: "", matricula: "", campus: "")
                
            }
            
        }
    }
    }
}
struct sideMenu: View{
    let width:CGFloat
    let isOpen: Bool
    let menuClose : () -> Void
    
    var body:some View{
        ZStack{
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
        }
        HStack {
            lateralView()
                .frame(width: self.width)
                .background(Color.white)
                .offset(x: self.isOpen ? 0 : self.width)
                .animation(.default)
            
            Spacer()
        }
    }
}
struct lateralView_Previews: PreviewProvider {
    static var previews: some View {
        lateralView()
    }
}
