//
//  ContentView.swift
//  CursoiOS
//
//  Created by Carmen on 04/06/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(.red)
            
            VStack {
                ThreeRectangles()
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.orange)
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        CircleAndRect()
                    }.frame(height: 250)
                   
                }
                
                ThreeRectangles()
                
            }
        }
        
        .padding()
    }
}

struct ThreeRectangles: View {
    var body: some View {
        HStack{
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(height: 120)
            
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 120)
            
            Rectangle()
                .foregroundColor(.yellow)
                .frame(height: 120)
        }
    }
}

struct CircleAndRect: View {
    var body: some View {
        HStack{
            Circle().foregroundColor(.green)
            Rectangle().foregroundColor(.black)
            Circle().foregroundColor(.purple)
            
        }
    }
}

#Preview {
    Exercise1()
}
