//
//  SuperHeroView.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var characters: [Character]? = nil
    @State var hasError: Bool = false
    @State var loading: Bool = false
    
    var body: some View {
        VStack{
            TextField("", text: $superheroName, 
                      prompt: Text("Busca a tu superheroe")
                                .font(.title2)
                                .foregroundColor(.gray)
                )
                .frame(maxWidth: .infinity, maxHeight: 45)
                .foregroundColor(.white)
                .font(.title2)
                .padding(.horizontal, 10)
                .bold()
                .background(.backgroundCompSelected.opacity(0.3))
                .cornerRadius(3)
                .padding(.horizontal, 15)
                .autocorrectionDisabled()
                .onChange(of: superheroName, { oldValue, newValue in
                    if(newValue == ""){
                        characters = nil
                        hasError = false
                    }
                
                })
                .onSubmit {
                    loading = true
                    characters = nil
                    
                    Task{
                        do{
                            let response =  try await ApiNetwork()
                                .getHeroesByQuery(query: superheroName.lowercased())
                            
                            if(response.results != nil){
                                hasError = false
                                characters = response.results!
                            }else{
                                hasError = true
                            }
                            
                        }catch{
                            hasError = true
                        }
                        
                        loading = false
                    }
                }
    
            if(loading) {
                ProgressView()
                    .frame(
                        width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                        height: 100)
                    .tint(.white)
            }
            
            if(hasError){
                TextErrorView(
                    isError: $hasError
                )
            }else if(characters != nil){
                ListRickAndMortyView(
                    characters: $characters
                )
            }
            
            Spacer()
            
        }.frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity)
        .background(.backgroundApp)
        .listRowBackground(Color.backgroundApp)
    }
}

#Preview {
    SuperheroSearcher()
}
