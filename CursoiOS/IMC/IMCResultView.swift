//
//  IMCResultView.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct IMCResultView: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        let resultIMC = calculateIMC(weight: userWeight, height: userHeight)
        
        VStack {
            Text("Tu indice de masa coorporal es: ")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .bold()
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            InformationView(result: resultIMC)
            
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity)
        .background(.backgroundApp)
       
    }
}

struct InformationView: View{
    let result: Double
    
    var body: some View {
        let informationHealty = getIMCResult(result: result)
        
        VStack{
            
            Spacer()
            
            Text(informationHealty.0)
                .font(.system(size: 40))
                .foregroundColor(informationHealty.2)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text(informationHealty.1)
                .font(.title3)
                .padding(.horizontal, 20)
                .foregroundColor(.gray)
            
            Spacer()
            
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
}

func calculateIMC(weight: Double, height: Double) -> Double {
    let result: Double = weight / ((height/100) * (height/100))
    return result
    
}

func getIMCResult(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...19.99:
        title = "Peso Bajo"
        description = "Esta por debajo del peso recomendado segun el IMC (indice de masa corporal)"
        color = Color.yellow
        
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estas en el peso recomendado segun el IMC (indice de masa corporal)"
        color = Color.green
        
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado segun el IMC (indice de masa corporal)"
        color = Color.orange
        
    case 30.00...100:
        title = "Obesidad"
        description = "Estas muy por encima del peso recomendado segun el IMC (indice de masa corporal)"
        color = Color.red
        
    default:
        title = "Error"
        description = "Ha ocurido un error inesperado"
        color = Color.gray
    }
    
    return (title, description, color)
    
}

#Preview {
    IMCResultView(userWeight: 60.0, userHeight: 180.0)
}
