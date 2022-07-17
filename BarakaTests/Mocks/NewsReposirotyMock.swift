//
//  NewsReposirotyMock.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation
import Combine
@testable import Baraka


class NewsRepositoryMock: NewsRepository {
    
    let newsArray = CurrentValueSubject<[Article], Error>([
        Article(title: "Article 1", description: "this is article 1", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 2", description: "this is article 2", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 3", description: "this is article 3", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 4", description: "this is article 4", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 5", description: "this is article 5", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 6", description: "this is article 6", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 7", description: "this is article 7", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 8", description: "this is article 8", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
        Article(title: "Article 9", description: "this is article 9", urlToImage: URL(string: "https://image1")!, publishedAt: "2022-07-17"),
    ])
    
    
    func fetchNews() -> AnyPublisher<[Article], Error> {
        return newsArray.eraseToAnyPublisher()
    }
    
    func latestNews() -> AnyPublisher<[Article], Error> {
        return newsArray.map{ Array($0.prefix(6)) }.eraseToAnyPublisher()
    }
    
    func news() -> AnyPublisher<[Article], Error> {
        return newsArray.map{ Array($0.suffix(from: 7)) }.eraseToAnyPublisher()
    }
    
    
}
