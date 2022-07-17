//
//  CSVReaderMock.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation
import Combine
@testable import Baraka

class CSVReaderMock: CSVReader {
    
    func toRows() -> AnyPublisher<[[String: String]], Never> {
        return [["PRICE": "1.234", "STOCK":"stock 1"], ["PRICE": "1.456", "STOCK":"stock 2"]].publisher.collect().eraseToAnyPublisher()
    }
}

