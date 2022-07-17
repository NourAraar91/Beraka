//
//  StockRepositoryMock.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation
import Combine
@testable import Baraka

class StockRepositoryMock: StockRepository {
    
    func fetchStocks() -> AnyPublisher<[Stock], Never> {
        return [Stock(price: Decimal(1.2312), symbol: "Stock 1"),
                Stock(price: Decimal(1.4655), symbol: "Stock 2"),
                Stock(price: Decimal(1.6744), symbol: "Stock 3"),
                Stock(price: Decimal(-1.8978), symbol: "Stock 4")]
            .publisher
            .collect()
            .eraseToAnyPublisher()
    }
}
