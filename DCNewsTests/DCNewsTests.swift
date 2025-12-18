//
//  DCNewsTests.swift
//  DCNewsTests
//
//  Created by Naman Deep on 18/12/25.
//

@testable import DCNews
import Foundation
import Testing

@MainActor
struct DCNewsTests {
    @Test func viewModelStartsEmpty() async throws{
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        
        #expect(viewModel.articles.isEmpty, "There should be no articles at first.")
        #expect(viewModel.loadState == .loading, "view model should be in Loading State")
    }
    
    @Test func viewModelLoadsArticles() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        
        #expect(viewModel.articles.isEmpty == false, "The articles should be loaded")
        #expect(viewModel.loadState == .loaded, "view model should be finished with loading State")
    }
    
    @Test func viewModelFilteringFull() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles( )
        
        #expect(viewModel.filteredArticles == viewModel.articles, "Empty text search must have all articles" )
    }
    
    @Test func viewModelFilteringExact() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        viewModel.filterText = viewModel.articles.first!.title
        
        #expect(viewModel.filteredArticles.count == 1, "Specific Search should find only one article")
        
    }
    
    @Test func viewModelFilteringEmpty() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        viewModel.filterText = "RANDOM SEARCH EMPTY"
        
        #expect(viewModel.filteredArticles.isEmpty, "Non-matching articles leads to zero results")
        
    }
    
    func createMockURLSession() throws -> URLSessionMock {
        let articles = [Article.example]
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        let articleData = try encoder.encode(articles)
        return URLSessionMock(data: articleData)
    }
}
