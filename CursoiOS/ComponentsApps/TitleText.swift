//
//  TitleText.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct TitleText: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.gray)
            .bold()
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TitleText(title: "titulos")
}
