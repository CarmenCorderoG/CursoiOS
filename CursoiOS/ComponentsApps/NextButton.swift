//
//  NextButton.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct NextButton: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: IMCResultView(
                userWeight: userWeight,
                userHeight: userHeight)
            ){
                Text("Calcular IMC")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .frame(
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        maxHeight: 100)
                    .foregroundColor(.white)
                    .background(.backgroundCompButton)
            }
        }
        
    }
}

#Preview {
    NextButton(userWeight: 80, userHeight: 180)
}
