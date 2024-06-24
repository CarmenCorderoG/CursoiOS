//
//  FavoritePlaceDialog.swift
//  CursoiOS
//
//  Created by Carmen on 20/06/24.
//

import SwiftUI
import MapKit

struct FavoritePlaceDialog: View {
    @Binding var coordinates: CLLocationCoordinate2D?
    @Binding var namePlace: String
    @Binding var isFav: Bool
    @Binding var places: [Place]
    let onClosePopUp: () -> Void
    
    
    var body: some View {
        VStack{
            Text("AÑADIR LOCALIZACION").font(.title2).padding(.top, 30)
            Spacer()
            TextField(
                "Nombre del lugar",
                text: $namePlace
            ).padding(10).background(.backgroundCompButton.opacity(0.10)).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Spacer()
            Toggle("¿Es un lugar favorito?", isOn: $isFav)
            Spacer()
            Button("Guardar"){
                if !namePlace.isEmpty {
                    savePlace(
                        name: namePlace,
                        coordinate: coordinates!,
                        hasFavorite: isFav
                    )
                    onClosePopUp()
                }
            }
            
            Spacer()
        }
    }
    
    func savePlace(
        name: String,
        coordinate: CLLocationCoordinate2D,
        hasFavorite: Bool
    ){
        let place = Place(
            name: name,
            coordinate: coordinate,
            hasFavorite: hasFavorite
        )
        
        places.append(place)
        
    }
}




/*#Preview {
    FavoritePlaceDialog()
}*/
