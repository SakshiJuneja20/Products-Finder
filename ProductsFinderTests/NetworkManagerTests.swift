//
//  NetworkManagerTests.swift
//  ProductsFinderTests
//
//  Created by Sakshi Juneja on 30/01/24.
//

import XCTest
@testable import ProductsFinder

final class NetworkManagerTests: XCTestCase {
    var sut: NetworkManager?

    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNetworkRequestSucces() async {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            return
        }
        var resultData: Result<Data, Error>!
        do {
            resultData = try await sut?.get(request: URLRequest(url: apiURL))
        } catch {
            XCTFail("Failed to load products")
        }
        let exp = expectation(description: "testNetworkRequestSucces")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(resultData)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    func testNetworkRequestFailure() async {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            return
        }
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        do {
            _ = try await sut?.get(request: request)
            XCTAssertNotNil(APIError.badRequest)
        } catch {
            XCTAssertTrue(false)
        }
    }

    func test_VerifyResponse_ServerErrorFailure() async {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            return
        }
        let json = ProductTestJSON.products
        let data = json.data(using: .utf8)!
        let response = HTTPURLResponse(url: apiURL, statusCode: 502, httpVersion: "", headerFields: nil)
        _ = sut?.verifyResponse(data: data, response: response!)
        XCTAssertNotNil(APIError.serverError)
    }

    func test_VerifyResponse_ValidateHttpResponseUrl() async {
        let json = ProductTestJSON.products
        let data = json.data(using: .utf8)!
        _ = sut?.verifyResponse(data: data, response: URLResponse())
        XCTAssertNotNil(APIError.serverError)
    }

    func test_VerifyResponse_UnknownStatusCodeFailure() async {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            return
        }
        let json = ProductTestJSON.products
        let data = json.data(using: .utf8)!
        let response = HTTPURLResponse(url: apiURL, statusCode: 305, httpVersion: "", headerFields: nil)
        _ = sut?.verifyResponse(data: data, response: response!)
        XCTAssertNotNil(APIError.unknown)
    }

}
