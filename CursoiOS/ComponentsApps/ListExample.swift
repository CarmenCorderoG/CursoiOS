//
//  ListExample.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI

var pokemons = [
    Pokemon(index: 1, name: "pokemon 1", power: 23),
    Pokemon(index: 2, name: "pokemon 2", power: 2334),
    Pokemon(index: 3, name: "pokemon 3", power: 231),
    Pokemon(index: 4, name: "pokemon 4", power: 2300),
    Pokemon(index: 5, name: "pokemon 5", power: 231),
    Pokemon(index: 6, name: "pokemon 6", power: 235),
    Pokemon(index: 7, name: "pokemon 7", power: 23),
    Pokemon(index: 8, name: "pokemon 8", power: 24)

]

var digimon = [
    Digimon(name: "Digimon 1"),
    Digimon(name: "Digimon 2"),
    Digimon(name: "Digimon 3"),
    Digimon(name: "Digimon 4"),
    Digimon(name: "Digimon 5"),
    Digimon(name: "Digimon 6"),
    Digimon(name: "Digimon 7")

]

struct ListExample: View {
    var body: some View {
        List{
            ForEach(pokemons, id: \.index) { pokemon in
                Text(pokemon.name)
            }
        }
        
        List(digimon) { digimon in
            Text(digimon.name)
        }
        
        List {
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id: \.index){ pokemon in
                    Text(pokemon.name)
                }
            }
            
            Section(header: Text("Digimon")){
                ForEach(digimon){ digimon in
                    Text(digimon.name)
                }
            }
        }
    }
}

#Preview {
    ListExample()
}
