//
//  ProductResponseModel.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import Foundation

// MARK: - ProductAPIResponse
struct ProductAPIResponse: Codable {
    var products: [Product]?
}

// MARK: - ProductsListResponse
struct Product: Codable, Identifiable {
    var id: Int?
    var title, productDescription: String?
    var price: Int?
    var rating: Double?
    var thumbnail: String?

    enum CodingKeys: String, CodingKey {
                                 case id, title
        case productDescription = "description"
        case price, rating, thumbnail
    }
}

// MARK: - ProductsListResponse extension for mock data
extension Product {
    static let mock = Product.mock()
    static func mock(id: Int = 0,
                     title: String = "iPhone 9",
                     productDescription: String = "",
                     price: Int? = 0,
                     rating: Double = 0.0,
                     thumbnail: String = "") -> Product {
        return Product(id: id,
                       title: title,
                       productDescription: productDescription,
                       price: price,
                       rating: rating,
                       thumbnail: thumbnail)
    }
}
