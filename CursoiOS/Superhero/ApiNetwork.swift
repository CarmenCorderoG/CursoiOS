//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import Foundation

class ApiNetwork {
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let urlCharacter: URL = URL(string: "https://rickandmortyapi.com/api/character/?name=\(query)")!
        let (data, _) = try await URLSession.shared.data(from: urlCharacter)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getCharacterDescription(id: String) async throws -> Detail {
        let urlCharacterDetail: URL = URL(string: "https://rickandmortyapi.com/api/character/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: urlCharacterDetail)
        
        let characterDetail = try JSONDecoder().decode(Detail.self, from: data)
        return characterDetail
    }
}
