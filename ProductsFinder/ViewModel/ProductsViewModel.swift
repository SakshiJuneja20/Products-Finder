//
//  ProductsViewModel.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [ProductsListResponse] = []
    @Published var error: Error? = nil
    var service: ProductsAPIProtocol
    
    init(service: ProductsAPIProtocol) {
        self.service = service
    }
    
    // MARK: - Get Products list count
    func getProductsCount() -> Int {
        return products.count
    }
    
    // MARK: - Get Products title for specific cell
    func getProductTitle(for indexPath: Int) -> String? {
        guard indexPath == 0, indexPath >= 0 else { return nil }
        return products[indexPath].title
    }
    
    // MARK: - Load all products list data
    func loadAllProducts() async throws {
        do {
            let list = try await service.getAllProducts()
            DispatchQueue.main.async {
                self.products = list.products!
            }
        } catch let error {
            self.error = error
        }
    }    
}
