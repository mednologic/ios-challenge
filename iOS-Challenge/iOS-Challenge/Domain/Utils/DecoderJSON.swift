//
//  DecodersJSON.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation

enum DecoderJSONError: Error {
    case noContent
    case decodingError(Error)
}

final class DecoderJSON {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getJSON<JSON>(from url: URL) async throws -> JSON where JSON: Decodable {
        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200 ..< 300).contains(httpResponse.statusCode) else {
            throw DecoderJSONError.noContent
        }

        do {
            let decodedJSON = try JSONDecoder().decode(JSON.self, from: data)
            return decodedJSON
        } catch let error as DecodingError {
            throw DecoderJSONError.decodingError(error)
        } catch {
            throw DecoderJSONError.noContent
        }
    }
}
