//
//  DataFetching.swift
//  DCNews
//
//  Created by Naman Deep on 18/12/25.
//

import Foundation

protocol DataFetching: Sendable {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching {
    
}
