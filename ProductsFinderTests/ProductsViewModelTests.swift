//
//  ProductsViewModelTests.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 21/01/24.
//

import XCTest
import SwiftUI
@testable import ProductsFinder

final class ProductsViewModelTests: XCTestCase {
    
    var sut: ProductsViewModel?
    var products = [ProductsListResponse]()
   
    override func setUp() {
        super.setUp()
        let service = MockProductsApiService(products: [])
        sut = ProductsViewModel(service: service)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetCountProducts_3products_3() async {
        let product1 = ProductsListResponse.mock(id: 0, title: "iPhone 9", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product2 = ProductsListResponse.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product3 = ProductsListResponse.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let service = MockProductsApiService(products: [product1, product2, product3])
        sut = ProductsViewModel(service: service)
        do {
            try await sut?.loadAllProducts()
        } catch {
            XCTFail("Failed to load products")
        }
        let exp = expectation(description: "testGetCountProducts_3products_3 Test after 1 second")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(sut?.getProductsCount(), 3)
        } else {
            XCTFail("Delay interrupted")
        }
        
    }
    
    func testGetProduct_3Products_returnFirstProduct() async {
        let product1 = ProductsListResponse.mock(id: 0, title: "iPhone 9", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product2 = ProductsListResponse.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product3 = ProductsListResponse.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let service = MockProductsApiService(products: [product1, product2, product3])
        sut = ProductsViewModel(service: service)
        do {
            try await sut?.loadAllProducts()
        } catch {
            XCTFail("Failed to load products")
        }
        let exp = expectation(description: "testGetProduct_3Products_returnFirstProduct Test after 1 second")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(sut?.getProductTitle(for: 0), "iPhone 9")
        } else {
            XCTFail("Delay interrupted")
        }
                
    }
    
    func testGet_Product_API_FailureRsponse_WithInvalidResponseFormat() async {
        let service = MockProductsApiService(error: ProductAPIError.invalidResponseFormat)
        sut = ProductsViewModel(service: service)
        do {
            try await sut?.loadAllProducts()
        } catch {
            XCTFail("Failed to load products")
        }
        
        let exp = expectation(description: "testGet_Product_API_FailureRsponse_WithInvalidResponseFormat Test after 1 second")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(sut?.error, "No Error while parsing json response")
        } else {
            XCTFail("Delay interrupted")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
