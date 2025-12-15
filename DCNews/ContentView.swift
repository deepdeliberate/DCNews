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
                NavigationLink(value: article){
                    HStack{
                        AsyncImage(url: article.thumbnail){phase in
                            switch phase{
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            default:
                                Image(systemName: "newspaper.fill")
                            }
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(.rect(cornerRadius:10))
                        VStack(alignment: .leading) {
                            Text(article.section)
                                .font(.caption.weight(.heavy))
                            
                            Text(article.title)
                        }
                    }
                }
            }
            .navigationTitle("DCNews")
            .navigationDestination(for: Article.self) { article in
                ArticleView(article: article)
            }
        }
        .task(loadArticles)
    }
    
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

#Preview {
    ContentView()
}
