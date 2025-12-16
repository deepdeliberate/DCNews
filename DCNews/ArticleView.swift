//
//  ArticleView.swift
//  DCNews
//
//  Created by Naman Deep on 15/12/25.
//

import SwiftUI

struct ArticleView: View {
    var article: Article
    
    var body: some View {
        ScrollView{
            ArticleImage(imageURL: article.image)
            VStack(alignment: .leading, spacing: 20){
                Text(article.title)
                    .font(.title)
                
                Text(article.description)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                Divider()
                
                Text(article.text)
            }
            .padding(.horizontal)
        }
        .navigationTitle(article.section)
        .navigationBarTitleDisplayMode( .inline )
    }
}

#Preview {
    ArticleView(article: .example)
}
