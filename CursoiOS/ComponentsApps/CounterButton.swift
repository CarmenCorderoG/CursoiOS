//
//  CounterButton.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct CounterButton: View {
    let titleCount : String
    @Binding var clickCount: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        
        VStack {
            TitleText(title: titleCount)
            InformationText(label: "\(clickCount)")
         
            HStack {
                CircleButton(
                    textButton: "-",
                    isPlus: false,
                    counter: $clickCount,
                    selectedGender: $selectedGender
                )
                
                CircleButton(
                    textButton: "+",
                    isPlus: true,
                    counter: $clickCount,
                    selectedGender: $selectedGender
                )
                
            }.padding(.horizontal, 20)
            
          
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity)
        .background(.backgroundCompButton)
    }
}

/*#Preview {
    @State var age: Int = 10
    @State var gender: Int = 0
    
    CounterButton(titleCount: "Edad", clickCount: $age, selectedGender: $gender)
}*/
