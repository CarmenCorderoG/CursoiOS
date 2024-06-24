//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var name: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            Text("Completa tu informacion:")
            
            TextField("Nombre", text: $name)
                .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(.gray.opacity(0.1))
                .cornerRadius(5)
                .padding(.horizontal, 20)
                .onChange(of: name){ oldValue, newValue in
                    print("El valor antiguo es \(oldValue) y el nuevo valor es: \(newValue)")
                }
            
            SecureField("Contraseña", text: $password)
                .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                .padding(16)
                .background(.gray.opacity(0.1))
                .cornerRadius(5)
                .padding(.horizontal, 20)
                .onChange(of: password){ oldValue, newValue in
                    print("El valor antiguo es \(oldValue) y el nuevo valor es: \(newValue)")
                }
        }
        
        
            
            
    }
}

#Preview {
    TextFieldExample()
}
