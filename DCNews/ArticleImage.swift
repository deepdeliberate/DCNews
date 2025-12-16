//
//  ArticleImage.swift
//  DCNews
//
//  Created by Naman Deep on 16/12/25.
//

import SwiftUI

struct ArticleImage: View {
    var imageURL: URL
    
    var body: some View {
        AsyncImage(url: imageURL){phase in
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
    }
}

#Preview {
    ArticleImage( imageURL: Article.example.image)
}
