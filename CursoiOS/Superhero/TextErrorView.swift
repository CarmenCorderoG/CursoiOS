//
//  TextErrorView.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI

struct TextErrorView: View {
    @Binding var isError: Bool
    
    var body: some View {
        
        Text("No se encontraron resultados a tu busqueda")
            .font(.title2)
            .foregroundColor(.red)
            .bold()
            .multilineTextAlignment(.center)
            .padding(.vertical, 10)
        
    }
}

/*#Preview {
    TextErrorView()
}*/
