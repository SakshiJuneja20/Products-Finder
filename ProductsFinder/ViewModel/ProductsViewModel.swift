//
//  ProductsViewModel.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import Foundation

protocol ProductsViewModelProtocol: ObservableObject {
    func loadAllProducts() async throws
}

final class ProductsViewModel: ProductsViewModelProtocol {
    @Published var products: [Product] = []
    @Published var error: Error?
    private var service: ProductsAPIProtocol

    init(service: ProductsAPIProtocol) {
        self.service = service
    }

    // MARK: - Load all products list data
    func loadAllProducts() async throws {
        do {
            let list = try await service.getAllProducts()
            DispatchQueue.main.async {
                guard let products = list.products else { return }
                self.products = products
            }
        } catch let error {
            print(error.localizedDescription)
            self.error = error
        }
    }
}
