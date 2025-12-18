//
//  URLSessionMock.swift
//  DCNewsTests
//
//  Created by Naman Deep on 18/12/25.
//

@testable import DCNews
import Foundation

struct URLSessionMock: DataFetching{
    var data: Data
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        (data, URLResponse())
    }
}
