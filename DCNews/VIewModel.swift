//
//  VIewModel.swift
//  DCNews
//
//  Created by Naman Deep on 16/12/25.
//

import Foundation

extension ContentView{
    enum LoadState{
        case loading, loaded, failed
    }
    
    @Observable @MainActor
    class ViewModel{
        private(set) var articles = [Article]()
        
        private(set) var loadState = LoadState.loading
        private(set) var loadError: (any Error)?
        
        var filterText = ""
        
        var filteredArticles: [Article] {
            if filterText.isEmpty{
                articles
            } else{
                articles.filter{
                    $0.title.localizedStandardContains(filterText)
                }
            }
        }
        
        // Lazy loading all the articles from the website.
        func loadArticles() async {
            loadState = .loading
            do{
                let url = URL(string: "https://hws.dev/news")!
                // Using ephemeral session
                let session = URLSession(configuration: .ephemeral)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                articles = try decoder.decode([Article].self, from: data)
                loadState = .loaded
            }
            catch{
                print(error.localizedDescription)
                loadState = .failed
                loadError = error
            }
        }
        
    }
}
