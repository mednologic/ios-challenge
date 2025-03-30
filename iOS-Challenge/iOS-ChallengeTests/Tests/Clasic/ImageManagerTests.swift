//
//  ImageManagerTests.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

@testable import iOS_Challenge
import XCTest

final class ImageManagerTests: XCTestCase {
    var imageManager: ImageManager!
    var dummyURL: URL!
    var dummyImage: UIImage!
    var dummyImageData: Data!

    override func setUp() {
        super.setUp()
        imageManager = ImageManager()
        dummyURL = URL(string: "https://example.com/test.jpg")!
        guard let systemImage = UIImage(systemName: "star") else {
            XCTFail("No se pudo crear la imagen dummy")
            return
        }
        dummyImage = systemImage
        guard let data = dummyImage.jpegData(compressionQuality: 1.0) else {
            XCTFail("No se pudo convertir la imagen dummy a datos")
            return
        }
        dummyImageData = data
        let response = HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil)
        URLProtocolFake.fake(data: dummyImageData, response: response, error: nil)

        URLProtocol.registerClass(URLProtocolFake.self)
    }

    override func tearDown() {
        URLProtocol.unregisterClass(URLProtocolFake.self)
        imageManager = nil
        dummyURL = nil
        dummyImage = nil
        dummyImageData = nil
        URLProtocolFake.reset()
        super.tearDown()
    }

    func testGetImageFromURLNetworkAndCache() async throws {
        let fetchedImage = try await imageManager.getImageFromURL(url: dummyURL)
        XCTAssertNotNil(fetchedImage, "Fetched image should not be nil")

        XCTAssertTrue(fetchedImage!.size.width > 0 && fetchedImage!.size.height > 0,
                      "Fetched image should have valid dimensions")

        URLProtocolFake.fake(data: nil, response: nil, error: NSError(domain: "TestError", code: 0, userInfo: nil))

        let cachedImage = try await imageManager.getImageFromURL(url: dummyURL)
        XCTAssertNotNil(cachedImage, "Cached image should not be nil")
        XCTAssertTrue(cachedImage!.size.width > 0 && cachedImage!.size.height > 0,
                      "Cached image should have valid dimensions")
    }
}
