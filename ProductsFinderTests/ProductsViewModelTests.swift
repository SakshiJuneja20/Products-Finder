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
    var products = [Product]()
   
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
        let product1 = Product.mock(id: 0, title: "iPhone 9", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product2 = Product.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product3 = Product.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
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
            XCTAssertEqual(sut?.products.count, 3)
        } else {
            XCTFail("Delay interrupted")
        }
        
    }
    
    func testGetProduct_3Products_returnFirstProduct() async {
        let product1 = Product.mock(id: 0, title: "iPhone 9", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product2 = Product.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
        let product3 = Product.mock(id: 0, title: "iPhone X", productDescription: "", price: 0, rating: 0.0, thumbnail: "")
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
            XCTAssertEqual(sut?.products[0].title, "iPhone 9")
        } else {
            XCTFail("Delay interrupted")
        }
                
    }

}
