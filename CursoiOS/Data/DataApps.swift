//
//  Pokemon.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI

struct Pokemon {
    let index: Int
    let name: String
    let power: Int
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

struct Apps: Identifiable {
    var id = UUID()
    let name: String
    let navigation: any View
}



