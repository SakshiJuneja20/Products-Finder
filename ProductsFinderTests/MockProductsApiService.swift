//
//  MockProductsApiService.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 21/01/24.
//

import Foundation

struct MockProductsApiService: ProductsAPIProtocol {
    
    let products: [ProductsListResponse]
    let error: Error?
    
    init(products: [ProductsListResponse]) {
        self.products = products
        self.error = nil
    }
    
    init(error: Error) {
        self.error = error
        self.products = [ProductsListResponse]()
    }
    
    func getAllProducts() async throws -> ProductAPIResponse {
        if let error = self.error {
            throw error
        }
        return ProductAPIResponse(products: products)
    }
}

