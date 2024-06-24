//
//  HeightCalculator.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    @Binding var selectedGender: Int
    
    var body: some View {
        let colorSlider = if(selectedGender == 0){
            Color.blue
        }else{
            Color.pink
        }
    
        VStack {
            TitleText(title: "Altura")
    
            InformationText(label: "\(Int(selectedHeight)) cm")
            
            Slider(
                value: $selectedHeight,
                in: 100...220,
                step: 1
            ).accentColor(colorSlider)
                .padding(.horizontal, 20)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundCompButton)
    }
}

/*#Preview {
    HeightCalculator()
}*/
