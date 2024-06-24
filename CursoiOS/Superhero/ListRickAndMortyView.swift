//
//  ListRickAndMortyView.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI

struct ListRickAndMortyView: View {
    @Binding var characters: [Character]?
    
    var body: some View {
        
        NavigationStack {
            
            List(characters ?? []){ character in
                ZStack{
                    
                    CharacterItem(
                        character: character)
                    NavigationLink(
                        destination: CharacterDetail(
                            id: character.id!
                        )
                    ){
                        EmptyView()
                    }.opacity(0)
                    
                }.listRowBackground(Color.backgroundApp)
                
            }.listStyle(.plain)
        }
    }
}

/*#Preview {
    @State var cha: [Character]? = [ Character(id: 0, name: "Rick and morty", status: "vivo", species: "humano", type: "persona", gender: "Hombre", image: "https://purina.com.pe/sites/default/files/styles/webp/public/2022-10/Que_debes_saber_antes_de_adoptar_un_gatito.jpg.webp?itok=N2sS0lfp", episode: [])]
    
    ListRickAndMortyView(characters: $cha)
}*/
