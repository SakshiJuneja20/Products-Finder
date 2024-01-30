//
//  MockNetworkManager.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 30/01/24.
//

import Foundation

final class MockNetworkManager: NetworkRequestProtocol {

    var result: Result<Data, Error>!

    func get(request: URLRequest) async throws -> Result<Data, Error> {
        return result
    }
}
