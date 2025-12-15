//
//  Article.swift
//  DCNews
//
//  Created by Naman Deep on 15/12/25.
//

import Foundation

// Article Model

struct Article: Codable, Hashable, Identifiable {
    let id: String
    var title: String
    var text: String
    
    var description: String
    var thumbnail: URL
    var date: Date
    var author: String
    
    var section: String
    var image: URL
    var url: URL
    
    static let example = Article(
        id: "1",
        title: "Kaitou Kid is the cosuin of Shinichi Kudo",
        text: "In new revelation in the DC Movie Million Dollar Pentagram, It was revelead that Kaitou Kid is the son of Yusako Kudo's twin brother. And Shinichi Kudo is the cousin of Kaitou Kid.",
        description: "Kaitou and Shinichi family ties revealed",
        thumbnail: URL(string: "https://en.wikipedia.org/wiki/Case_Closed#/media/File:Case_Closed_Volume_36.png")!,
        date: .now,
        author: "Naman Deep",
        section: "News",
        image: URL(string: "https://en.wikipedia.org/wiki/Case_Closed#/media/File:Case_Closed_Volume_36.png")!,
        url: URL(string: "www.artstation.com/naman")!
    )
}
