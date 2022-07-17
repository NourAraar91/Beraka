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
    private let csvReader: CSVReader
    
    init(csvReader: CSVReader) {
        self.csvReader = csvReader
    }
    
    func fetchStocks() -> [Stock] {
        let rows = csvReader.toRows()
        return rows.map { Stock(price: Decimal(string: $0["PRICE"] ?? "") ?? .zero, symbol: $0["STOCK"] ?? "") }
    }
}
