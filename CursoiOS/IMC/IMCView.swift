//
//  IMCView.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct IMCView: View {
    
    /*init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }*/
    
    @State var gender: Int = 0
    @State var height: Double = 160
    @State var age: Int = 18
    @State var weight: Int = 80
    
    var body: some View {
        VStack{
            HStack {
                ToogleButton(
                    titleButton: "Hombre",
                    colorImage: Color.blue,
                    gender: 0,
                    selectedGender: $gender
                )
                
                ToogleButton(
                    titleButton: "Mujer",
                    colorImage: Color.pink,
                    gender: 1,
                    selectedGender: $gender
                )
            }
            
            HeightCalculator(selectedHeight: $height, selectedGender: $gender)
            
            HStack {
                CounterButton(
                    titleCount: "Edad", 
                    clickCount: $age,
                    selectedGender: $gender
                )
                
                CounterButton(
                    titleCount: "Peso",
                    clickCount: $weight,
                    selectedGender: $gender
                )
            }
            
            NextButton(
                userWeight: Double(weight),
                userHeight: height
            )
    
            
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("IMC Calculator").bold().foregroundColor(.white)
                
            }
        }
        
        //.navigationTitle("IMC Calculator")
    }
}



#Preview {
    IMCView()
}
