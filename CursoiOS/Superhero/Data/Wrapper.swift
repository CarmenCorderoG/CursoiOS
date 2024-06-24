//
//  Wrapper.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import Foundation

struct Wrapper: Codable {
    let results: [Character]?
    let error: String?
}

struct Character: Codable, Identifiable{
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let episode: [String]?
    
}
