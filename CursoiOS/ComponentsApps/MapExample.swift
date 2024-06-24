//
//  MapExample.swift
//  CursoiOS
//
//  Created by Carmen on 20/06/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.6145779,
                longitude: -99.0460959
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.005,
                longitudeDelta: 0.005
            )
        )
    )
    
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.standard)
        }
        
    }
}

#Preview {
    MapExample()
}
