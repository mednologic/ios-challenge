//
//  NetworkServiceTests.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import XCTest
@testable import iOS_Challenge

final class NetworkServiceTests: XCTestCase {

    var dummyURL: URL!

    override func setUp() {
        super.setUp()
        dummyURL = URL(string: "https://example.com/property")!
        URLProtocol.registerClass(URLProtocolFake.self)
    }

    override func tearDown() {
        URLProtocol.unregisterClass(URLProtocolFake.self)
        dummyURL = nil
        URLProtocolFake.reset()
        super.tearDown()
    }

    func testSuccessfulResponseWithMockPropertyModel() async throws {
        let expectedModel = PropertyModel.mockPropertyModelRent
        let jsonData = try JSONEncoder().encode(expectedModel)

        let response = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolFake.fake(data: jsonData, response: response, error: nil)

        var request = URLRequest(url: dummyURL)
        request.httpMethod = "GET"

        let model: PropertyModel = try await NetworkService.shared.getJSONToModel(request: request,
                                                                                  type: PropertyModel.self)

        XCTAssertEqual(model, expectedModel, "The decoded PropertyModel should match the expected mock")
    }

    func testBadStatusCodeThrowsNetworkError() async {
        let response = HTTPURLResponse(url: dummyURL, statusCode: 500, httpVersion: nil, headerFields: nil)
        URLProtocolFake.fake(data: nil, response: response, error: nil)

        var request = URLRequest(url: dummyURL)
        request.httpMethod = "GET"

        do {
            _ = try await NetworkService.shared.getJSONToModel(request: request, type: PropertyModel.self)
            XCTFail("Expected NetworkError.badResponse but succeeded")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.badResponse)
        }
    }

    func testDecodingFailureThrowsError() async {
        let invalidJSON = Data("invalid json".utf8)
        let response = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolFake.fake(data: invalidJSON, response: response, error: nil)

        var request = URLRequest(url: dummyURL)
        request.httpMethod = "GET"

        do {
            _ = try await NetworkService.shared.getJSONToModel(request: request, type: PropertyModel.self)
            XCTFail("Expected decoding failure but succeeded")
        } catch {
            XCTAssertTrue(error is DecodingError, "Expected a decoding error")
        }
    }

    func testNetworkErrorIsThrown() async {
        let error = NSError(domain: "TestError", code: -1001, userInfo: nil)
        URLProtocolFake.fake(data: nil, response: nil, error: error)

        var request = URLRequest(url: dummyURL)
        request.httpMethod = "GET"

        do {
            _ = try await NetworkService.shared.getJSONToModel(request: request, type: PropertyModel.self)
            XCTFail("Expected network error but succeeded")
        } catch {
            XCTAssertEqual((error as NSError).domain, "iOS_Challenge.NetworkError", "Expected custom network error")
        }
    }
}
