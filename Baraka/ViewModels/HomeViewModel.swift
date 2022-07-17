//
//  HomeViewModel.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation
import Combine

protocol HomeViewModel {
    var stocksPublisher: CurrentValueSubject<[Stock], Never> { get set }
    var latestNewsPublisher: CurrentValueSubject<[Article], Never> { get set }
    var newsPublisher: CurrentValueSubject<[Article], Never> { get set }
}

class HomeViewModelImpl: HomeViewModel {
    var stocksPublisher =  CurrentValueSubject<[Stock], Never>([])
    var latestNewsPublisher = CurrentValueSubject<[Article], Never>([])
    var newsPublisher = CurrentValueSubject<[Article], Never>([])
    
    private let stockRepository: StockRepository
    private let newsRepository: NewsRepository
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(stockRepository: StockRepository = StockRepositoryImpl(),
         newsRepository: NewsRepository = NewsRepositoryImpl()) {
        self.stockRepository = stockRepository
        self.newsRepository = newsRepository
        
        getStocks()
        getLatestNews()
        getNews()
    }
    
    
    func getStocks() {
        stockRepository.fetchStocks()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get users: \(error)")
                case .finished: break
                }
            }) { stocks in
                self.stocksPublisher.send(stocks)
            }
            .store(in: &subscriptions)
    }
    
    
    func getLatestNews() {
        newsRepository.latestNews()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get users: \(error)")
                case .finished: break
                }
            }) { news in
                self.latestNewsPublisher.send(news)
            }
            .store(in: &subscriptions)
    }
    
    
    func getNews() {
        newsRepository.news()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get users: \(error)")
                case .finished: break
                }
            }) { news in
                self.newsPublisher.send(news)
            }
            .store(in: &subscriptions)
    }
}
