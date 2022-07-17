//
//  StockRepositoryTests.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/16/22.
//

import XCTest
@testable import Baraka

final class StockRepositoryTests: XCTestCase {
    
    var sut: StockRepository?
    var csvReader: CSVReader?
    
    override func setUpWithError() throws {
        csvReader = CSVReaderMock()
        sut = StockRepositoryImpl(csvReader: csvReader!)
    }
    
    override func tearDownWithError() throws {
        csvReader = nil
        sut = nil
    }
    
    
    func test_stock_respository_fetch_stocks_should_return_two_stocks() {
        let stocks = try! XCTUnwrap(sut?.fetchStocks())
        XCTAssertEqual(stocks.count, 2)
    }
    
    
    func test_stock_repository_fetch_stocks_should_return_list_of_stocks() {
        let stocks = try! XCTUnwrap(sut?.fetchStocks())
        let expectedPrice = try! XCTUnwrap(stocks[0].price.formattedString())
        XCTAssertEqual(expectedPrice, "USD 1.23")
        XCTAssertEqual(stocks[0].symbol, "stock 1")
    }
    
}
