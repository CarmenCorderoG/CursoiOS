//
//  ProviderPlaces.swift
//  CursoiOS
//
//  Created by Carmen on 21/06/24.
//

import Foundation

extension FavPlacesView {
    
    func savePlace(){
        if let encodeData = try? JSONEncoder().encode(places){
            UserDefaults.standard.setValue(encodeData, forKey: "places")
        
        }
    }
    
    func loadPlaces(){
        if let savePlaces = UserDefaults.standard.data(forKey: "places"),
           let decodePlaces = try? JSONDecoder().decode([Place].self, from: savePlaces){
            places = decodePlaces
        }
        
    }
}
