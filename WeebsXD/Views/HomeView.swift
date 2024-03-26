//
//  HomeView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var MangaSelected:Bool = true
    
    var body: some View {
        ScrollView{
            LazyVStack{
                topBar()
                
                HStack{
                    Text("Continue...").font(.system(size: 20))
                    Spacer()
                    Text("See More").foregroundColor(Color.orange)
                }.padding(.horizontal, 13)
                Recent()
                HStack{
                    Text("Popular 🔥").font(.system(size: 20))
                    Spacer()
                    HStack{
                        HStack{
                            Text("Manga").foregroundColor(MangaSelected ? .black : .black.opacity(0.5)).padding(10).background(MangaSelected ? .white : .clear).cornerRadius(30).onTapGesture {
                                MangaSelected = true
                            }
                            Text("Tv/Movie").foregroundColor(!MangaSelected ? .black : .black.opacity(0.5)).padding(10).background(!MangaSelected ? .white : .clear).cornerRadius(30).onTapGesture {
                                MangaSelected = false
                            }
                        }.padding(5)
                    }.background(.gray.opacity(0.1)).cornerRadius(30)
                }.padding(.horizontal, 13)
                ListPopularView()
                Spacer()
            }
        }.background(.thinMaterial)
    }
}

#Preview {
    HomeView()
}

struct Recent: View {
    var body: some View {
        NavigationLink(destination: DetailView(judul: "SweetShop", image: "SweetShop")) {
            ListRecentView(image:"SweetShop", isAnime: false, title: "あまさや/Sweet Shop", chap: "09/22", rating: 7.42)
        }.foregroundColor(.black)
        NavigationLink(destination: DetailView(judul: "bokunokokoro", image: "bokunokokoro")) {
            ListRecentView(image:"bokunokokoro", isAnime: true, title: "Boku no Kokoro no Yabai Yatsu", chap: "127/140", rating: 8.32)
        }.foregroundColor(.black)
        NavigationLink(destination: DetailView(judul: "slaveofthehell", image: "slaveofthehell")) {
            ListRecentView(image:"slaveofthehell", isAnime: true, title: "Slave of the Hell Soldiers", chap: "09/22", rating: 7.42)
        }.foregroundColor(.black)
    }
}

struct topBar: View {
    @State var textFieldText: String = ""
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Hello, Good Morning 👏").multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                    Text("Ujang Nungging").bold().multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                HStack{
                    Group{
                        Image("message").padding(10)
                    }.background(Color.white).cornerRadius(20)
                    Group{
                        Image("notif").padding(10)
                    }.background(Color.white).cornerRadius(20)
                }
            }.padding(.vertical, 10).padding(.horizontal, 13)
            TextField("Search Anime here...", text: $textFieldText)
                                .padding(.horizontal)
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .background(Color.white)
                                .cornerRadius(15).shadow(radius: 0.7).padding(.horizontal, 13)

            HStack{
                Image("Movie")
                Image("Manga")
            }

        }
    }
}
