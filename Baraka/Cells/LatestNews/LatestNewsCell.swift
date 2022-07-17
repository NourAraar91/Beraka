//
//  LatestNewsCell.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import UIKit

struct LatestNewsCellViewModel {

    let title: String
    let image: URL
    
    init(article: Article) {
        self.title = article.title
        self.image = article.urlToImage
    }
}


class LatestNewsCell: UICollectionViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: LatestNewsCellViewModel) {
        self.titleLable.text = viewModel.title
        self.imageView.load(from: viewModel.image)
    }

}
