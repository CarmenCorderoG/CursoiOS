//
//  ImaExample.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct ImaExample: View {
    var body: some View {
      
        Image("bebe")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            
        Image(systemName: "figure.fall")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 50)
        
    
    }
}

#Preview {
    ImaExample()
}
