//
//  ContentView.swift
//  DCNews
//
//  Created by Naman Deep on 15/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.articles, rowContent: ArticleRow.init)
                .navigationTitle("DCNews")
                .navigationDestination(for: Article.self) { article in
                ArticleView(article: article)
            }
        }
        .task(viewModel.loadArticles)
    }
    

}

#Preview {
    ContentView()
}
