//
//  StockRepository.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation

protocol StockRepository {
    func fetchStocks() -> [Stock]
}


class StockRepositoryImpl: StockRepository {
    private let stocksCSVReader: CSVReader
    
    init(stocksCSVReader: CSVReader) {
        self.stocksCSVReader = stocksCSVReader
    }
    
    func fetchStocks() -> [Stock] {
        let rows = stocksCSVReader.toRows()
        return rows.map { Stock(price: Decimal(string: $0["PRICE"] ?? "") ?? .zero, symbol: $0["STOCK"] ?? "") }
    }
}
