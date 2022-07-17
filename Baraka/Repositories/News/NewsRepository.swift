//
//  NewsRepository.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation
import Combine

protocol NewsRepository {
    func fetchNews() -> AnyPublisher<[Article], Error>
    func latestNews() -> AnyPublisher<[Article], Error>
    func news() -> AnyPublisher<[Article], Error>
}


class NewsRepositoryImpl: NewsRepository {
    private let newtworkClient: NetworkClient
    private var articles: [Article]?
    
    init(newtworkClient: NetworkClient = NetworkClientImp()) {
        self.newtworkClient = newtworkClient
    }
    
    func fetchNews() -> AnyPublisher<[Article], Error> {
        return newtworkClient.featchNews()
    }
    
    func latestNews() -> AnyPublisher<[Article], Error> {
        return fetchNews().map { Array($0.prefix(6)) }.eraseToAnyPublisher()
    }
    
    func news() -> AnyPublisher<[Article], Error> {
        return fetchNews().map { Array($0.suffix(from: 7)) }.eraseToAnyPublisher()
    }
    
}
