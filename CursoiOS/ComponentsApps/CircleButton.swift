//
//  CircleButton.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct CircleButton: View {
    let textButton: String
    let isPlus: Bool
    
    @Binding var counter: Int
    @Binding var selectedGender: Int
    
    
    var body: some View {
        let backgrounColor = if(selectedGender == 0){
            Color.blue
        }else{
            Color.pink
        }
            
        Button (
            action: {
                counter = if isPlus && counter < 100 {
                    counter + 1
                }else if !isPlus && counter > 0 {
                    counter - 1
                }else{
                    counter
                }
                    
            },
            label: {
                InformationText(label: textButton)
            }
        ).frame(
            maxWidth: 100,
            maxHeight: 100)
        .background(backgrounColor)
        .clipShape(.circle)
       
    }
}


/*#Preview {
    CircleButton(textButton: "text")
}*/
