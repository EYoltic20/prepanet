//
//  animacion.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 09/11/22.
//

import Foundation
import Lottie
import SwiftUI

struct animacion : UIViewRepresentable{
    let url : String
    let animationView = LottieAnimationView()
    
    func makeUIView(context:UIViewRepresentableContext<animacion>)-> UIView{
        let view = UIView(frame: .zero)
        Animation.loadedFrom(url: URL(string: url)!, closure:{animation in
            animationView.animation = animation
            animationView.contentMode = .scaleToFill
            animationView.loopMode = .loop
            animationView.animationSpeed=1.0
            animationView.play()
            view.addSubview(animationView)
            animationView.translatesAutoresizingMaskIntoConstraints = false
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            
            
        },animationCache: nil )
        
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
