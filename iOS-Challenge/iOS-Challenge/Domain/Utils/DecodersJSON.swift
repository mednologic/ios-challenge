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

final class DecodersJSON {
    public static let shared = DecodersJSON()

    func getJSON<JSON>(from url: URL) async throws -> JSON where JSON: Decodable {
        let (data, _) = try await URLSession.shared.getData(from: url)

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
