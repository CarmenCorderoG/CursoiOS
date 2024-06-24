//
//  FavPlacesView.swift
//  CursoiOS
//
//  Created by Carmen on 20/06/24.
//

import SwiftUI
import MapKit

struct FavPlacesView: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.6144809,
                longitude: -99.0460529),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01)
            )
        )
    
    @State var places: [Place] = []
    @State var showPopUp: Bool = false
    @State var coordinate: CLLocationCoordinate2D? = nil
    @State var namePlace: String = ""
    @State var isFav: Bool = false
    @State var showSheet: Bool = false
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map {
        PresentationDetent.fraction($0)
    }

    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position){
                    ForEach(places){ place in
                        Annotation(place.name, coordinate: place.coordinate, content: {
                            let color = if place.hasFavorite { Color.yellow } else { Color.red }
                            Circle().foregroundColor(color).frame(width: 20, height: 20)
                        })
                    }
                    
                }.onTapGesture { coord in
                    showPopUp = true
                    coordinate = proxy.convert(coord, from: .local)
                }.overlay(content: {
                    VStack {
                        Button("Show List"){
                            showSheet = true
                        }.padding(.horizontal, 16)
                         .padding(.vertical, 8)
                         .background(.white)
                         .cornerRadius(5)
                         .padding(16)
                        
                        Spacer()
                    }
                })
                    
            }
            
            if showPopUp && coordinate != nil {
                withAnimation {
                    CustomDialog(
                        onCloseDialog: {
                            cleanForm()
                        },
                        onDismissOutside: true,
                        content: FavoritePlaceDialog(
                            coordinates: $coordinate,
                            namePlace: $namePlace,
                            isFav: $isFav,
                            places: $places,
                            onClosePopUp: {
                                savePlace()
                                cleanForm()
                            }
                        )
                    )
                }
            }
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places){ place in
                        VStack{
                            Text(place.name)
                        }.frame(width: 200, height: 150).overlay{
                            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1)
                        }.shadow(radius: 5)
                            .onTapGesture {
                                animateCamara(coordinate: place.coordinate)
                                showSheet = false
                            }
                    }
                }
                
            }.presentationDetents(Set(height))
        }.onAppear{
            loadPlaces()
        }
    }
    
    func cleanForm(){
        showPopUp = false
        coordinate = nil
        namePlace = ""
        isFav = false
    }
    
    func animateCamara(coordinate: CLLocationCoordinate2D){
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: coordinate.latitude,
                        longitude: coordinate.longitude),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.001,
                        longitudeDelta: 0.001)
                    )
                )
            
        }
        
    }
}

#Preview {
    FavPlacesView()
}
