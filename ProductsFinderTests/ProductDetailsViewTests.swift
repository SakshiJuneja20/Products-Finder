//
//  ProductDetailsViewTests.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 30/01/24.
//

import XCTest
@testable import ProductsFinder

final class ProductDetailsViewTests: XCTestCase {

    func testProductDetailsPriceAndRatingViewView() async throws {
        let sut = ProductDetailsPriceAndRatingView(title: "iPhone", value: "a")
        XCTAssertNotNil(sut)
    }

    func testProductInformationDetailsViewView() async throws {
        let sut = ProductInformationDetailsView(product: Product())
        XCTAssertNotNil(sut)
    }

}
