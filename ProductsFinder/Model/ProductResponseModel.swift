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
