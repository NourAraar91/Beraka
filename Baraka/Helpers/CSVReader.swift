//
//  CSVReader.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation
import SwiftCSV

protocol CSVReader {
    func toRows() -> [[String: String]]
}


class StockCSVReader: CSVReader {
    
    private let csv: CSV<Named>?
    
    init(url: URL) {
        self.csv = try? CSV<Named>(url: url)
    }
    
    func toRows() -> [[String : String]] {
        guard let csv = csv else { return [] }
        return csv.rows
    }
}

