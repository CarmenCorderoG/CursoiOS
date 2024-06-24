//
//  TextExample.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Custom").font(.system(
                    size: 40,
                    weight: .heavy,
                    design: .serif
            ).italic()
            )
            
            Text("Carmen carmen carmen eres tan exitosa muy muy muy muy exitosa ")
                .frame(width: 300)
                .lineLimit(2)
                .lineSpacing(50.0)
            
        }
    }
}

#Preview {
    TextExample()
}
