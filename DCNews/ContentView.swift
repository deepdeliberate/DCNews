//
//  ContentView.swift
//  DCNews
//
//  Created by Naman Deep on 15/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var articles = [Article]()
    
    var body: some View {
        NavigationStack{
            List(articles) { article in
                NavigationLink(article.title, value: article)
            }
            .navigationDestination(for: Article.self) { article in
                Text(article.text)
            }
        }
        .task(loadArticles)
    }
    
    func loadArticles() async {
        do{
            let url = URL(string: "https://hws.dev/news")!
            let session = URLSession(configuration: .ephemeral)
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            articles = try decoder.decode([Article].self, from: data)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
