//
//  AnimeViewModel.swift
//  WeebsXD
//
//  Created by Heical Chandra on 20/03/24.
//

import Foundation

class AnimeViewModel:ObservableObject {
    @Published var items: [AnimeModel] = []
    let itemsKey: String = "items_list"
    
    var hasBeenCalled = false
    
    init(){
        getItems()
    }
    
    func initRamadhan(){
        let newItems = [
            AnimeModel(title: "Solat subuh", image:"ayam", chap: "22/22",rating: 8.2, isAnime: false),
            AnimeModel(title: "Solat subuh", image:"ayam", chap: "22/22",rating: 8.2, isAnime: false),
            AnimeModel(title: "Solat subuh", image:"ayam", chap: "22/22",rating: 8.2, isAnime: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([AnimeModel].self, from: data)
        else {return}
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = savedItems
    }
}
