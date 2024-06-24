//
//  MenuView.swift
//  CursoiOS
//
//  Created by Carmen on 05/06/24.
//

import SwiftUI

var apps = [
    Apps(name: "IMC Calculator", navigation: IMCView()),
    Apps(name: "Superhero finder", navigation: SuperheroSearcher()),
    Apps(name: "My Favorite places", navigation: FavPlacesView())
]

struct MenuView: View {
    var body: some View {
        
        VStack{
            NavigationStack {
                TitleText(title: "Apps Examples")
                
                List(apps) { app in
                    NavigationLink(destination: AnyView(app.navigation)){
                        Text(app.name)
                    }
                    
                }.listStyle(.inset)
            }
        }
    }
}

#Preview {
    MenuView()
}
