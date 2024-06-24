//
//  ToolbarApp.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

struct ToolbarApp: View {
    var body: some View {
        ToolbarItem(placement: .principal){
            Text("IMC Calculator").bold().foregroundColor(.white)
            
        }
    }
}

#Preview {
    ToolbarApp()
}
