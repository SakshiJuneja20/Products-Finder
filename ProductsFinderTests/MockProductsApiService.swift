//
//  MockProductsApiService.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 21/01/24.
//

import Foundation

struct MockProductsApiService: ProductsAPIProtocol {

    enum TestJsonType {
        case validJson
        case invalidJson
    }

    var jsonType = TestJsonType.validJson

    func getAllProducts() async throws -> ProductAPIResponse {
        let json = jsonType == .validJson ? ProductTestJSON.products : ProductTestJSON.invalidJson
        let data = json.data(using: .utf8)!
        do {
            return try JSONDecoder().decode(ProductAPIResponse.self, from: data)
        } catch {
            throw error
        }
    }
}

enum ProductTestJSON {
    static let products = """
    {
        "products": [
            {
                "id": 1,
                "title": "iPhone 9",
                "description": "An apple mobile which is nothing like apple",
                "price": 549,
                "discountPercentage": 12.96,
                "rating": 4.69,
                "stock": 94,
                "brand": "Apple",
                "category": "smartphones",
                "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
                "images": [
                    "https://cdn.dummyjson.com/product-images/1/1.jpg",
                    "https://cdn.dummyjson.com/product-images/1/2.jpg",
                    "https://cdn.dummyjson.com/product-images/1/3.jpg",
                    "https://cdn.dummyjson.com/product-images/1/4.jpg",
                    "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
                ]
            },
            {
                "id": 2,
                "title": "iPhone X",
                "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
                "price": 899,
                "discountPercentage": 17.94,
                "rating": 4.44,
                "stock": 34,
                "brand": "Apple",
                "category": "smartphones",
                "thumbnail": "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg",
                "images": [
                    "https://cdn.dummyjson.com/product-images/2/1.jpg",
                    "https://cdn.dummyjson.com/product-images/2/2.jpg",
                    "https://cdn.dummyjson.com/product-images/2/3.jpg",
                    "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"
                ]
            }
        ]
    }
    """

    static let invalidJson = """
    {
        "products": [
                "id": 2,
                "title": "iPhone X",
                "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
                "price": 899,
                "discountPercentage": 17.94,
                "rating": 4.44,
        ]
    }
    """
}
