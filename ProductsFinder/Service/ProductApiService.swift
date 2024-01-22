//
//  ProductApiService.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import Foundation

protocol ProductsAPIProtocol {
    func getAllProducts() async throws -> ProductAPIResponse
}

enum ProductAPIError: Error {
    case invalidURL
    case invalidResponseFormat
}

final class ProductsAPIService: ProductsAPIProtocol {
    private let networkManager: NetworkRequestProtocol
    
    init(networkManager: NetworkRequestProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    // MARK: - Get all products list data from server
    func getAllProducts() async throws -> ProductAPIResponse {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            throw ProductAPIError.invalidURL
        }
        let urlRequest = URLRequest(url: apiURL)
        let apiData = try await networkManager.get(request: urlRequest)
        switch apiData {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(ProductAPIResponse.self, from: data)
            } catch {
                throw ProductAPIError.invalidResponseFormat
            }
        case .failure(let error):
            throw error
        }
    }
}
