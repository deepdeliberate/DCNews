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
}
