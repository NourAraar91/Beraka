//
//  CSVReaderMock.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation
@testable import Baraka

class CSVReaderMock: CSVReader {
    
    func toRows() -> [[String : String]] {
        return [["PRICE": "1.234", "STOCK":"stock 1"], ["PRICE": "1.456", "STOCK":"stock 2"]]
    }
}

