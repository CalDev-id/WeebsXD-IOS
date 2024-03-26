//
//  DetailView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 18/03/24.
//

import SwiftUI

struct DetailView: View {
    let judul:String
    let image:String

    var body: some View {
        NavigationView{
            ScrollView {
                LazyVStack{
                    ZStack{
                        Image(image).resizable().scaledToFill().frame(width: .infinity).frame(height: UIScreen.main.bounds.width / 2, alignment: .top)
                            .clipped().padding(.horizontal, 10)
                        VStack {
                            Spacer().frame(minHeight: 260)
                            HStack{
                                Image(image).resizable().frame(width: 120, height: 170)
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text(judul).font(.system(size: 22))
                                    Group{
                                        Image(systemName: "bookmark").padding(10).padding(.horizontal, 2)
                                    }.background(Color.white).cornerRadius(20)
                                }
                            }.multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 10).background(.clear)
                        }
                    }
                    InformationView()
                    
                    VStack(alignment: .leading){
                        Text("Title").font(.system(size: 20))
                        title()
                    }.padding().background(.white).cornerRadius(10)
                    
                    VStack(alignment: .leading){
                        Text("Author").font(.system(size: 20))
                        Text("Okano YUU")
                            .foregroundColor(Color.black) // Warna teks berubah sesuai status
                            .padding(3).background(Color.white).cornerRadius(10)
                    }.padding().background(.white).cornerRadius(10).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 10)
                    
                    Image("manga1").resizable().scaledToFit()
                    Image("manga2").resizable().scaledToFit()
                }
            }.background(.thinMaterial)
        }.navigationBarTitle(Text(judul))
    }
}

#Preview {
    DetailView(judul: "Boku no Kokoro no Yabai Yatsu", image: "bokunokokoro")
}

struct language{
    let flag:String
    let judul:String
}

struct title: View {
    let items1 = [
        language(flag: "🇺🇸", judul: "The Unwanted Undead Adventurer"),
        language(flag: "🇯🇵", judul: "Nozomanu Fushi no Boukensha"),
        language(flag: "🇯🇵", judul: "望まぬ不死の冒険者"),
        language(flag: "🇫🇷", judul: "L'aventurier immortel indésiré"),
        language(flag: "🇰🇷", judul: "바라지 않는 불사의 모험자"),
        language(flag: "🇷🇺", judul: "Нежеланно бессмертный авантюрист"),
        language(flag: "🇭🇰", judul: "事與願違的不死冒險者"),

    ]
    
    var body: some View {
        ForEach(items1, id: \.judul){ item2 in
            HStack{
                Text(item2.flag)
                Text(item2.judul)
            }
        }
    }
}

struct InformationView: View {
    let items = ["Detail", "Chapter", "Review", "Character", "Art Cover"]
        @State var selectedIndex = 0 // Index tab yang terpilih
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(items.indices, id: \.self) { index in
                    Button(action: {
                        // Ketika tab ditekan, atur index terpilih
                        selectedIndex = index
                    }){
                        Text(items[index])
                            .foregroundColor(index == selectedIndex ? Color.black : Color.secondary) // Warna teks berubah sesuai status
                            .padding(10).background(index == selectedIndex ? Color.white : Color.clear).cornerRadius(10)
                    }
                }
            }.padding(.leading, 5).padding(.vertical, 5)
        }.background(.secondary.opacity(0.1)).cornerRadius(10).padding(.leading)
    }
}
