//
//  AnimeModel.swift
//  WeebsXD
//
//  Created by Heical Chandra on 20/03/24.
//

import Foundation

struct AnimeModel: Identifiable, Codable {
    let id: String
    let title: String
    let image:String
    let chap:String
    let rating:Double
    let isAnime: Bool
    
    init(id: String = UUID().uuidString, title: String, image:String, chap:String, rating:Double, isAnime: Bool){
        self.id = id
        self.title = title
        self.image = image
        self.chap = chap
        self.rating = rating
        self.isAnime = isAnime
        
    }
    
    func updateCompletion() -> AnimeModel {
        return AnimeModel(id: id, title: title, image: image, chap: chap, rating: rating, isAnime: isAnime)
    }
    
    func updateTitle() -> AnimeModel {
        return AnimeModel(id: id, title: "ical", image: image, chap: chap, rating: rating, isAnime: isAnime)
    }
}
