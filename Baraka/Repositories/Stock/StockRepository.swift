//
//  StockRepository.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation
import Combine

protocol StockRepository {
    func fetchStocks() -> AnyPublisher<[Stock], Never>
}


class StockRepositoryImpl: StockRepository {
    private let csvReader: CSVReader
    
    init(csvReader: CSVReader = StockCSVReader(url: Constants.stocksURL) ) {
        self.csvReader = csvReader
    }
    
    func fetchStocks() -> AnyPublisher<[Stock], Never> {
        return csvReader.toRows()
            .map { $0.map({ row in Stock(price: Decimal(string: row["PRICE"] ?? "") ?? .zero,  symbol: row["STOCK"] ?? "" ) })}
            .map { Dictionary(grouping: $0) { $0.symbol } }
            .map { $0.map { $0.value.randomElement()! } }
            .map { $0.sorted{ $0.symbol < $1.symbol} }
            .eraseToAnyPublisher()
          
    }
}
