//
//  VIewModel.swift
//  DCNews
//
//  Created by Naman Deep on 16/12/25.
//

import Foundation

extension ContentView{
    @Observable @MainActor
    class ViewModel{
        private(set) var articles = [Article]()
        
        // Lazy loading all the articles from the website.
        func loadArticles() async {
            do{
                let url = URL(string: "https://hws.dev/news")!
                // Using ephemeral session
                let session = URLSession(configuration: .ephemeral)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                articles = try decoder.decode([Article].self, from: data)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
    }
}
