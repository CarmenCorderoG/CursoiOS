//
//  ToogleButton.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct ToogleButton: View {
    let titleButton: String
    let colorImage: Color
    let gender: Int
    
    @Binding var selectedGender: Int
    
    var body: some View {
        let colorBackground = if(gender == selectedGender){
            Color.backgroundCompSelected
        }else{
            Color.backgroundCompButton
        }
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack{
            
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(colorImage)
                    .frame(width: 80, height: 80)
                
                InformationText(label: titleButton)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(colorBackground)
            
            
        }
    }
}

/*#Preview {
    //ToogleButton(titleButton: "Mujer", colorImage: Color.pink , gender: 0)
}*/
