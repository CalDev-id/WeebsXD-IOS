//
//  LibraryView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 16/03/24.
//

import SwiftUI

struct Anime {
    let image: String
    let isAnime: Bool
    let title: String
    let chap: String
    let rating: Double
}

struct LibraryView: View {
    let animeList = [
        Anime(image: "kumo", isAnime: false, title: "Kumo Desu ga, Nani ka?", chap: "49/71", rating: 8.92),
        Anime(image: "yofukashi", isAnime: false, title: "Yofukashi no Uta", chap: "78/79", rating: 9.08),
        Anime(image: "saihate", isAnime: false, title: "Saihate no Paladin", chap: "21/39", rating: 9.27),
        Anime(image: "teisou", isAnime: false, title: "Teisou Gyakuten Sekai no Dout", chap: "9/21", rating: 8.58),
        Anime(image: "vinland", isAnime: false, title: "Vinland Saga", chap: "140/140", rating: 9.2)
    ]
    
    let items = ["Action", "Romance", "School", "Fantasy"]
        @State var selectedIndex = 0 // Index tab yang terpilih

    var body: some View {
        ScrollView{
            LazyVStack{
                topBarView()
                HStack{
                    VStack{
                        Text("My Library").font(.system(size: 25)).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                        Text("What do you want to read today?").foregroundColor(.secondary).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Group{
                        Image(systemName: "magnifyingglass").padding(10)
                    }.background(Color.white).cornerRadius(20)
                }.padding(.horizontal, 15)
                HStack {
                    ForEach(items.indices, id: \.self) { index in
                        Button(action: {
                            // Ketika tab ditekan, atur index terpilih
                            selectedIndex = index
                        }) {
                            Text(items[index])
                                .foregroundColor(index == selectedIndex ? Color.orange : Color.black) // Warna teks berubah sesuai status
                                .padding()
                        }
                    }
                }
                if selectedIndex == 0 {
                    VStack{
                        ForEach(animeList, id: \.title) { anime in
                            ListRecentView(image: anime.image, isAnime: anime.isAnime, title: anime.title, chap: anime.chap, rating: anime.rating)
                        }
                    }
                } else if selectedIndex == 1 {
                    ListRecentView(image: animeList[1].image, isAnime: animeList[1].isAnime, title: animeList[1].title, chap: animeList[1].chap, rating: animeList[1].rating)
                }
                else if selectedIndex == 2 {
                    ListRecentView(image: animeList[1].image, isAnime: animeList[1].isAnime, title: animeList[1].title, chap: animeList[1].chap, rating: animeList[1].rating)
                    ListRecentView(image: animeList[0].image, isAnime: animeList[0].isAnime, title: animeList[0].title, chap: animeList[0].chap, rating: animeList[0].rating)
                }
                else if selectedIndex == 3 {
                    ListRecentView(image: animeList[3].image, isAnime: animeList[3].isAnime, title: animeList[3].title, chap: animeList[3].chap, rating: animeList[3].rating)
                    ListRecentView(image: animeList[4].image, isAnime: animeList[4].isAnime, title: animeList[4].title, chap: animeList[4].chap, rating: animeList[4].rating)
                }
            }
        }.background(.thinMaterial)
    }
}

#Preview {
    LibraryView()
}

struct topBarView: View {
    @State var MangaSelected:Bool = true
    
    var body: some View {
        HStack{
            HStack{
                HStack{
                    Text("Manga").foregroundColor(MangaSelected ? .black :.black.opacity(0.5)).padding(10).background(MangaSelected ? .white : .clear).cornerRadius(30).onTapGesture {
                        MangaSelected = true
                    }
                    Text("Tv/Movie").foregroundColor(!MangaSelected ? .black : .black.opacity(0.5)).padding(10).background(!MangaSelected ? .white : .clear).cornerRadius(30).onTapGesture {
                        MangaSelected = false
                    }
                }.padding(5)
            }.background(.gray.opacity(0.1)).cornerRadius(30)
            Spacer()
            Text("Edit Genre").font(.system(size: 20)).foregroundColor(.orange).bold()
        }.padding(.horizontal, 13)
    }
}
