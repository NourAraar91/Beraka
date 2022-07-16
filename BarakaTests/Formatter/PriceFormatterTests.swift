//
//  PriceFormatterTests.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/16/22.
//

import XCTest
@testable import Baraka

final class PriceFormatterTests: XCTestCase {
    
    
    func test_decimal_formatter_return_USD_x_xx_fomrat_when_more_than_5() {
        let price = Decimal(string: "1.2377")!
        let formattedPrice = try! XCTUnwrap(price.formattedString())
        
        XCTAssertEqual("USD 1.24", formattedPrice)
    }

    func test_decimal_formatter_return_USD_x_xx_fomrat_when_less_than_5() {
        let price = Decimal(string: "1.2323")!
        let formattedPrice = try! XCTUnwrap(price.formattedString())
        
        XCTAssertEqual("USD 1.23", formattedPrice)
    }
    
    func test_decimal_formatter_negative_number_should_return_negative_USD_x_xx_fomrat() {
        let price = Decimal(string: "-1.2377")!
        let formattedPrice = try! XCTUnwrap(price.formattedString())
        
        XCTAssertEqual("-USD 1.24", formattedPrice)
    }

}
