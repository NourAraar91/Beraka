//
//  CSVReader.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation
import SwiftCSV
import Combine

protocol CSVReader {
    func toRows() -> AnyPublisher<[[String: String]], Never>
}


class StockCSVReader: CSVReader {
    
    private let csv: CSV<Named>?
    
    init(url: URL) {
        self.csv = try? CSV<Named>(url: url)
    }
    
    func toRows() -> AnyPublisher<[[String: String]], Never> {
        guard let csv = csv else { return [].publisher.eraseToAnyPublisher() }
        let rows: [[String: String]] = csv.rows
        return rows.publisher.collect().eraseToAnyPublisher()
    }
}

