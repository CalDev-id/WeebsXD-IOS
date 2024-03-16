//
//  ListPopularView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 16/03/24.
//

import SwiftUI

struct ListPopularView: View {
    let gridItems = Array(repeating: GridItem(), count: 2) // 2 kolom

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
//            ForEach(0..<4) { index in
//                Text("Item \(index)")
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .cornerRadius(8)
//            }
            PopularItemView(image: "vilainess", judul: "Villainess Level 99 ~I May Be the Hidden B..", rating: 8.86)
            PopularItemView(image: "apotek", judul: "The Apothecary Diaries", rating: 9.31)
            PopularItemView(image: "mairi", judul: "Mairimashita! Iruma-kun", rating: 8.86)
            PopularItemView(image: "apotek2", judul: "The Apothecary Diaries", rating: 9.31)
        }
        .padding()
    }
}

#Preview {
    ListPopularView()
}

struct PopularItemView: View {
    let image:String
    let judul:String
    let rating:Double
    
    var body: some View {
        VStack{
            Image(image)
            Text(judul).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "star").foregroundColor(.orange)
                Text(String(format: "%.1f", rating))
                Text("/ 10.0")
                Spacer()
            }
            Group{
                Text("+ Bookmark").foregroundColor(.orange).padding(.horizontal, 40).padding(.vertical,7)
                
            }.background(.white).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.orange, lineWidth: 2))
        }
    }
}
