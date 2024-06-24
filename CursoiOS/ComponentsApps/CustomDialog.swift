//
//  CustomDialog.swift
//  CursoiOS
//
//  Created by Carmen on 20/06/24.
//

import SwiftUI

struct CustomDialog<Content: View>: View {
    let onCloseDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    
    var body: some View {
        ZStack {
            Rectangle().fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside {
                        withAnimation{
                            onCloseDialog()
                        }
                    }
                }
            
            content
                .frame(
                    width: UIScreen.main.bounds.size.width - 100,
                    height: 300)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay(alignment: .topTrailing) {
                    Button (action: {
                        withAnimation{
                            onCloseDialog()
                        }
                        
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        
                    })
                    .foregroundColor(.gray)
                    .padding(16)
                }
            
            
        }.ignoresSafeArea()
            .frame(
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.height,
                alignment: .center
            )
        
    }
}

/*#Preview {
    CustomDialog()
}*/
