//
//  HomeViewModelTests.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/17/22.
//

import XCTest
@testable import Baraka

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModelImpl!
    
    override func setUpWithError() throws {
        sut = HomeViewModelImpl(stockRepository: StockRepositoryMock(), newsRepository: NewsRepositoryMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func test_fetchStocks_shouldPublishStocksList() throws {
        
        let stocks = try wait(for: sut.stocksPublisher, afterChange: {
            sut?.getStocks()
        })
        
        XCTAssertEqual(stocks.count, 4)
    }
    
    func test_fetchLatestNews_shouldPublishLatestNewsList() throws {
        
        let latestNews = try wait(for: sut.latestNewsPublisher, afterChange: {
            sut?.getLatestNews()
        })
        
        XCTAssertEqual(latestNews.count, 6)
    }
    
    func test_fetchNews_shouldPublishNewsList() throws {
        
        let news = try wait(for: sut.newsPublisher, afterChange: {
            sut?.getNews()
        })
        
        XCTAssertEqual(news.count, 3)
    }
    

}
