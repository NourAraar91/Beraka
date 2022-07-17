//
//  NewsRepository.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation


protocol NewsRepository {
    func fetchNews() async throws
    func latestNews() async throws -> [Article]
    func news() async throws -> [Article]
}


class NewsRepositoryImpl: NewsRepository {
    private let newtworkClient: NetworkClient
    private var articles: [Article]?
    
    init(newtworkClient: NetworkClient = NetworkClientImp()) {
        self.newtworkClient = newtworkClient
    }
    
    func fetchNews() async throws {
        articles = try await newtworkClient.featchNews()
    }
    
    func latestNews() async throws -> [Article] {
        if articles == nil {
           try await fetchNews()
        }
        return Array(articles?.prefix(6) ?? [])
    }
    
    func news() async throws -> [Article] {
        if articles == nil {
           try await fetchNews()
        }
        return Array(articles?.suffix(from: 7) ?? [])
    }
    
}
