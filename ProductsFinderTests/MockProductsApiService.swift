//
//  MockProductsApiService.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 21/01/24.
//

import Foundation

struct MockProductsApiService: ProductsAPIProtocol {
    
    let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    func getAllProducts() async throws -> ProductAPIResponse {
        return ProductAPIResponse(products: products)
    }
}

