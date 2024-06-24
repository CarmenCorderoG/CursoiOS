//
//  CharacterDetail.swift
//  CursoiOS
//
//  Created by Carmen on 06/06/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct CharacterDetail: View {
    let id: Int
    
    @State var detail: Detail? = nil
    @State var loading: Bool = true
    
    var body: some View {
        ScrollView{
            
            VStack {
                if loading {
                    ProgressView().tint(.white)
                }else if let detail = detail {
                    WebImage(url: URL(string: detail.image))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                        .clipped()
                    
                    TitleText(title: detail.name)
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                    
                    DetailCharacter(textInfo: "Estatus: \(detail.status)")
                    DetailCharacter(textInfo: "Sexo: \(detail.gender)")
                    DetailCharacter(textInfo: "Especie: \(detail.species)")
                    DetailCharacter(textInfo: "Planeta: \(detail.origin.name)")
                    DetailCharacter(textInfo: "Episodios: \(detail.episode.count)")
                   
                    
                    Spacer()
                    
                    ParticipationEpisodes(
                        episodes: detail.episode
                    )
                    
                    Text("Esta grafica representa las participaciones en las que ha salido este personaje a lo largo de las temporadas de la serie, considerando desde la temporaada 1 hasta laa temporda 4.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(20)
                    
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .onAppear{
                Task {
                    do{
                        detail = try await ApiNetwork()
                            .getCharacterDescription(
                                id: String(id)
                            )
                        
                    }catch{
                        detail = nil
                    }
                    
                    loading = false
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

struct DetailCharacter: View {
    let textInfo: String
    
    var body: some View {
        HStack{
            TitleText(title: textInfo)
            Spacer()
        }.padding(.horizontal, 20)
    }
}

struct ParticipationEpisodes: View {
    let episodes: [String] 
    
    var body: some View {
        VStack {
            
            Chart {
                SectorMark(angle: 
                        .value("Count", episodes.count),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Temporada 1"))
                
                SectorMark(angle:
                        .value("Count", episodes.count),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Temporada 2"))
                
                SectorMark(angle:
                        .value("Count", episodes.count),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Temporada 3"))
                
                SectorMark(angle:
                        .value("Count", episodes.count),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Temporada 4"))
            }.padding(16)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 350)
            .background(.backgroundCompButton)
            .cornerRadius(5)
            .padding(20)
            .clipped()
    }
}

#Preview {
    CharacterDetail(id: 145)
}
