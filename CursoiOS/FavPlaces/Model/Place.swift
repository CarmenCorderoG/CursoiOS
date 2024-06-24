//
//  Place.swift
//  CursoiOS
//
//  Created by Carmen on 20/06/24.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var hasFavorite: Bool
    
    enum CodingKeys: CodingKey {
        case id, name, hasFavorite, latitude, longitude
    }
    
    init(id: UUID = UUID(), name: String, coordinate: CLLocationCoordinate2D, hasFavorite: Bool) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
        self.hasFavorite = hasFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        name = try container.decode(String.self, forKey: .name)
        hasFavorite = try container.decode(Bool.self, forKey: .hasFavorite)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
        
        try container.encode(name, forKey: .name)
        try container.encode(hasFavorite, forKey: .hasFavorite)
        try container.encode(id, forKey: .id)
    }
}
