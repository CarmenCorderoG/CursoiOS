//
//  LabelView.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        Label("Texto de la imagen", systemImage: "figure.wave")
        Label(
            title:{ Text("Texto de la imagen 2")},
            icon: {
                Image("bebe")
                    .resizable()
                    .scaledToFill()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
        ).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    LabelView()
}
