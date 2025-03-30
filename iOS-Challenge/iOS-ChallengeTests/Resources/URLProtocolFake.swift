//
//  URLProtocolFake.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

final class URLProtocolFake: URLProtocol {
    static var fakeData: Data?
    static var fakeResponse: HTTPURLResponse?
    static var fakeError: Error?

    static func fake(data: Data?, response: HTTPURLResponse?, error: Error?) {
        fakeData = data
        fakeResponse = response
        fakeError = error
    }

    static func reset() {
        fakeData = nil
        fakeResponse = nil
        fakeError = nil
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let error = URLProtocolFake.fakeError {
            client?.urlProtocol(self, didFailWithError: error)
        } else {
            if let response = URLProtocolFake.fakeResponse {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            if let data = URLProtocolFake.fakeData {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        }
    }

    override func stopLoading() {}
}
