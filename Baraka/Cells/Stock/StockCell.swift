//
//  StockCell.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import UIKit

struct StockCellViewModel {
    let symbol: String
    let price: String
    let priceColor: UIColor
    
    init(stock: Stock) {
        self.symbol = stock.symbol
        self.price = stock.price.formattedString() ?? ""
        self.priceColor =  stock.price.sign == .minus ? UIColor.red : UIColor.green
    }
}


class StockCell: UICollectionViewCell {
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = 10.0
        bgView.clipsToBounds = true
    }
    
    func configure(with viewModel: StockCellViewModel) {
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        priceLabel.textColor = viewModel.priceColor
    }
    
}
