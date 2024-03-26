//
//  APIFetch.swift
//  WeebsXD
//
//  Created by Heical Chandra on 25/03/24.
//

import SwiftUI

struct AnimeAPI: Codable {
    let mal_id: Int
    let rank: Int
    let title: String
}

struct APIFetch: View {
    @State private var topAnime: [AnimeAPI] = []

    func fetchTopAnime() {
        guard let url = URL(string: "https://api.jikan.moe/v4/top/anime") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let decodedResponse = try? JSONDecoder().decode([AnimeAPI].self, from: data) {
                DispatchQueue.main.async {
                    self.topAnime = decodedResponse
                }
                return
            }

            print("Failed to decode response")
        }.resume()
    }

    var body: some View {
        VStack {
            Button("Fetch Top Anime") {
                fetchTopAnime()
            }
            List(topAnime, id: \.mal_id) { anime in
                VStack(alignment: .leading) {
                    Text("Rank: \(anime.rank)")
                        .font(.headline)
                    Text("Title: \(anime.title)")
                        .font(.subheadline)
                }
            }
        }    }
}

#Preview {
    APIFetch()
}
