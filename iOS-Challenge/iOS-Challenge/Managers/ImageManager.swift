//
//  ImageManager.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

/// Optional bonus: images fetched or by cache
final class ImageManager {
    enum ImageError: Error {
        case imageDataInvalid
        case imageProcessingFailed
    }

    private let memoryCache = NSCache<NSString, UIImage>()

    func getImageFromURL(url: URL) async throws -> UIImage? {
        let cacheKey = url.lastPathComponent as NSString
        let imageURL = URL.cachesDirectory.appending(path: url.lastPathComponent)

        if let cachedImage = memoryCache.object(forKey: cacheKey) {
            return cachedImage
        }

        if FileManager.default.fileExists(atPath: imageURL.path),
           let imageData = try? Data(contentsOf: imageURL),
           let image = UIImage(data: imageData) {
            memoryCache.setObject(image, forKey: cacheKey)
            return image
        }

        let (data, _) = try await URLSession.shared.getData(from: url)
        guard let image = UIImage(data: data) else {
            throw ImageError.imageDataInvalid
        }

        memoryCache.setObject(image, forKey: cacheKey)
        if let jpgData = image.jpegData(compressionQuality: 0.7) {
            try jpgData.write(to: imageURL, options: .atomic)
        }

        return image
    }
}
