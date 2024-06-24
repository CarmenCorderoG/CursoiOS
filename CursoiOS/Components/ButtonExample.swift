//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("holiwii"){
            print("es un botoon con su accion")
        }
        
        Button(
            action: {
                print("mi boton")
            },
            label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 50)
                    .background(.red)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
        })
    }
}

struct ButtonWithStates: View {
    @State var pressButton: Int = 0
    
    var body: some View {
        Button(
            action: {
                pressButton += 1
            },
            label: {
                Text("Press button Counter: \(pressButton)")
                    .bold()
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(4)
                    .padding()
                    
            
            }
        )

    }
}

#Preview {
    ButtonWithStates()
}
