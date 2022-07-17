//
//  NetworkClient.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation
import Combine

protocol NetworkControllerProtocol {
    func get<T>(type: T.Type,
                url: URL
    ) -> AnyPublisher<T, Error> where T: Decodable
}


final class NetworkController: NetworkControllerProtocol {
    
    func get<T: Decodable>(type: T.Type,
                           url: URL
    ) -> AnyPublisher<T, Error> {
        
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

protocol NetworkClient {
    func featchNews() -> AnyPublisher<[Article], Error>
}

class NetworkClientImp: NetworkClient {
    
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol = NetworkController()) {
        self.networkController = networkController
    }
    
    func featchNews() -> AnyPublisher<[Article], Error> {
        let url = Constants.newsURL
        
        return networkController.get(type: NewsResponse.self,
                                     url: url)
        .map { $0.articles }
        .eraseToAnyPublisher()
    }
    
}
