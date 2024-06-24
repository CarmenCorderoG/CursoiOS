//
//  InformationText.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct InformationText: View {
    let label: String
    
    var body: some View {
        Text("\(label)")
            .bold()
            .font(.largeTitle)
            .foregroundStyle(.white)
    }
}

#Preview {
    InformationText(label: "Mujer")
}
