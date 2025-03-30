//
//  EncoderJSON.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import Foundation

enum EncoderError: Error {
    case encodingFailed(Error)
    case invalidData
}

class EncoderJSON {
    static let shared = EncoderJSON()

    func encodeToJSON<T: Encodable>(_ value: T) throws -> Data {
        do {
            let data = try JSONEncoder().encode(value)
            return data
        } catch let error as EncodingError {
            throw EncoderError.encodingFailed(error)
        } catch {
            throw EncoderError.invalidData
        }
    }
}
