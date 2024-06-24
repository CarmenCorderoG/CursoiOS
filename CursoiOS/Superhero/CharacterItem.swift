//
//  CharacterItem.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterItem: View {
   let character: Character
    
    var body: some View {
        HStack {
            VStack {
                WebImage(url: URL(string: character.image ?? ""))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(5)
                    .frame(height: 200)
                    
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            

            VStack{
                Spacer()
                Text("Nombre:")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                
                Text(character.name ?? "")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Text("Especie:")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                
                Text(character.species ?? "")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(.backgroundCompSelected)
                .cornerRadius(5)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200)
    
    }
}

#Preview {
    SuperheroSearcher()
}
