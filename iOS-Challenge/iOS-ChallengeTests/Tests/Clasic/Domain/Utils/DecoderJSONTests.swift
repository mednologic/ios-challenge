//
//  DecoderJSONTests.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

@testable import iOS_Challenge
import XCTest

final class DecoderJSONTests: XCTestCase {
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolFake.self]
    }

    override func tearDown() {
        URLProtocolFake.reset()
        super.tearDown()
    }

    func testGetJSONDecodesSingleProperty() async throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolFake.self]
        let testSession = URLSession(configuration: config)

        let url = URL(string: "https://example.com/property")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!

        URLProtocolFake.fake(data: Data.mockPropertyDetailJSON, response: response, error: nil)

        let decoder = DecoderJSON(session: testSession)
        let result: PropertyModel = try await decoder.getJSON(from: url)

        XCTAssertEqual(result.propertyCode, "123")
    }

    func testGetJSONThrowsDecodingError() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolFake.self]
        let testSession = URLSession(configuration: config)

        let url = URL(string: "https://example.com/property")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!

        URLProtocolFake.fake(data: Data.mockInvalidJSON, response: response, error: nil)

        let decoder = DecoderJSON(session: testSession)
        do {
            let _: PropertyModel = try await decoder.getJSON(from: url)
            XCTFail("Expected decoding error, but no error was thrown")
        } catch {
            guard case DecoderJSONError.decodingError = error else {
                XCTFail("Expected decodingError, got: \(error)")
                return
            }
        }
    }

    func testGetJSONThrowsNoContentForBadStatusCode() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolFake.self]
        let testSession = URLSession(configuration: config)

        let url = URL(string: "https://example.com/property")!
        let badResponse = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)!

        URLProtocolFake.fake(data: Data.mockPropertyDetailJSON, response: badResponse, error: nil)

        let decoder = DecoderJSON(session: testSession)
        do {
            let _: PropertyModel = try await decoder.getJSON(from: url)
            XCTFail("Expected noContent error for bad status code, but no error was thrown")
        } catch {
            guard case DecoderJSONError.noContent = error else {
                XCTFail("Expected noContent error, got: \(error)")
                return
            }
        }
    }

    func testGetJSONThrowsNetworkErrorWhenErrorProvided() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolFake.self]
        let testSession = URLSession(configuration: config)

        let url = URL(string: "https://example.com/property")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!

        let networkError = NSError(domain: "Network", code: -1009, userInfo: nil)
        URLProtocolFake.fake(data: nil, response: response, error: networkError)

        let decoder = DecoderJSON(session: testSession)
        do {
            let _: PropertyModel = try await decoder.getJSON(from: url)
            XCTFail("Expected network error, but no error was thrown")
        } catch {
            guard let nsError = error as NSError?, nsError.domain == "Network" else {
                XCTFail("Expected network error, got: \(error)")
                return
            }
        }
    }
}
