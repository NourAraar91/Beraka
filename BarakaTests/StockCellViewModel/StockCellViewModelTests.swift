//
//  StockCellViewModelTests.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/18/22.
//

import XCTest
@testable import Baraka

final class StockCellViewModelTests: XCTestCase {

    var sut: StockCellViewModel!
    
    
    override func setUpWithError() throws {
        sut = StockCellViewModel(stock: Stock(price: Decimal(1.23), symbol: "Stock 1"))
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_stockCellViewModel_setSymbol() {
        XCTAssertEqual(sut.symbol, "Stock 1")
    }
    
    func test_stockCellViewModel_setPrice() {
        XCTAssertEqual(sut.price, "USD 1.23")
    }
    
    func test_stockCellViewModel_positivePrice_return_greenColor() {
        XCTAssertEqual(sut.priceColor, UIColor.green)
    }
    
    func test_stockCellViewModel_negitivePrice_return_redColor() {
        sut = StockCellViewModel(stock: Stock(price: Decimal(-1.23), symbol: "Stock 1"))
        XCTAssertEqual(sut.priceColor, UIColor.red)
    }

}
