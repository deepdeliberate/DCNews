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
            switch viewModel.loadState {
            case .failed:
                LoadFailedView(error: viewModel.loadError, retry: viewModel.loadArticles)
            default:
                if viewModel.articles.isEmpty {
                    ProgressView("Loading...")
                        .controlSize(.extraLarge)
                }
                else {
                    List(viewModel.filteredArticles, rowContent: ArticleRow.init)
                        .navigationTitle("DCNews")
                        .navigationDestination(for: Article.self, destination: ArticleView.init)
                        .refreshable(action: viewModel.loadArticles)
                        .searchable(text: $viewModel.filterText, prompt: "Filter Articles")
                }
            }
        }
        .task(viewModel.loadArticles)
    }
    

}

#Preview {
    ContentView()
}
