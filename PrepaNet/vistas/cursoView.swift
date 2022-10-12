//
//  cursoView.swift
//  PrepaNet
//
//  Created by Emilio Y Martinez on 11/10/22.
//

import SwiftUI

struct cursoView: View {
    var curso :String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.blue)
            .overlay{
                Text("\(curso)")
            }
    }
}

struct cursoView_Previews: PreviewProvider {
    static var previews: some View {
        cursoView(curso: "MATE")
    }
}
