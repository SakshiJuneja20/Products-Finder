//
//  ProductApiServiceTests.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 30/01/24.
//

import XCTest
@testable import ProductsFinder

final class ProductApiServiceTests: XCTestCase {
    private var mockNetworkManager: MockNetworkManager!
    private var productApiService: ProductsAPIService!

    override func setUp() {
        mockNetworkManager = MockNetworkManager()
        productApiService = ProductsAPIService(networkManager: mockNetworkManager)
    }

    override func tearDown() {
        mockNetworkManager = nil
        productApiService = nil
    }

    func testGetAllProducts() async {
        let json = ""
        let data = json.data(using: .utf8)!
        mockNetworkManager.result = .success(data)

        var products: [Product]?

        do {
            products = try await productApiService.getAllProducts().products
        } catch {
            XCTAssertNotNil(error)
        }
        let exp = expectation(description: "testGetAllProducts")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNil(products)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    func testSuccess() async {
        let json = ProductTestJSON.products
        let data = json.data(using: .utf8)!
        mockNetworkManager.result = .success(data)

        var products: [Product]?

        do {
            products = try await productApiService.getAllProducts().products
        } catch {
            XCTFail("Failed to load products")
        }
        let exp = expectation(description: "testSuccess")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(products)
            XCTAssertEqual(products?.count, 2)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func testFailure() async {
        var errorException: Error?
        mockNetworkManager.result = .failure(ProductAPIError.invalidResponseFormat)

        do {
            _ = try await productApiService.getAllProducts().products
            XCTFail("Should throw an error")
        } catch {
            errorException = error
            XCTAssertNotNil(errorException)
        }

    }

}
