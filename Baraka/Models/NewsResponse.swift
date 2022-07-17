//
//  NewsResponse.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Hashable {
    let title: String?
    let description: String?
    let urlToImage: URL?
    let publishedAt: String?
}

