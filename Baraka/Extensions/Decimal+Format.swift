//
//  Decimal+Format.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import Foundation


extension Decimal {
    
    func formattedString() -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = "USD"
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.roundingMode = .halfDown
        return currencyFormatter.string(from: self as NSDecimalNumber)
    }
}
