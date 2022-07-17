//
//  NetworkClient.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation

protocol URLSessionProtocol {
  func data(for request: URLRequest,
            delegate: URLSessionTaskDelegate?)
  async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}


protocol NetworkClient {
    func featchNews() async throws -> [Article]
}

class NetworkClientImp: NetworkClient {
    
    lazy var session: URLSessionProtocol = URLSession.shared
    
    func featchNews() async throws -> [Article] {
        let url = Constants.newsURL
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request, delegate: nil)
        let articlesResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
        return articlesResponse.articles
    }
    
}
