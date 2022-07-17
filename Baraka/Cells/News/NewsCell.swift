//
//  NewsCell.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import UIKit

struct NewsCellViewModel {

    let title: String
    let image: URL
    let description: String
    let date: String
    
    init(article: Article) {
        self.title = article.title
        self.image = article.urlToImage
        self.description = article.description
        self.date = article.publishedAt
    }
}

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.cornerRadius = 10.0
        bgView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
    }
    
    func configure(with viewModel: NewsCellViewModel) {
        self.titleLable.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.descriptionLabel.text = viewModel.description
        self.imageView.load(from: viewModel.image)
    }

}
