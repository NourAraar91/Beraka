//
//  UIImageView+Ext.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import UIKit

extension UIImageView {
    func load(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func load(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        load(from: url, contentMode: mode)
    }
}
