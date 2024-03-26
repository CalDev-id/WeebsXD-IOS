//
//  ListRecentView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI

struct ListRecentView: View {
    let image:String
    let isAnime:Bool
    let title:String
    let chap:String
    let rating:Double
    
    var body: some View {
        HStack{
            HStack{
                Image(image)
                VStack{
                    Group{
                        Text(isAnime ? "TV / MOVIE" : "Manga").foregroundColor(isAnime ? .orange : .black).font(.system(size: 14))
                    }.padding(.horizontal, 13).padding(.vertical, 5).background(isAnime ? .orange.opacity(0.1) : .gray.opacity(0.1)).foregroundColor(.black).cornerRadius(20).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                    Text(title).font(.system(size: 20)).padding(.bottom, 5).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        if(!isAnime){
                            Image(systemName: "book")
                            HStack {
                                Text(chap)
                                Text("Chap")
                            }
                            Spacer()
                        }
                        
                        Image(systemName: "star").foregroundColor(.orange)
                        Text("7,42/10.0")
                        Spacer()
                    }
                }
            }.padding(8)
        }.background(.white).cornerRadius(10).shadow(radius: 0.5).padding(.horizontal, 13)
    }
}

#Preview {
    ListRecentView(image:"SweetShop", isAnime: false, title: "あまさや/Sweet Shop", chap: "09/22", rating: 7.42)
}
