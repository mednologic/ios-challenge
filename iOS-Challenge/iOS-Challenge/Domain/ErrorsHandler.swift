//
//  ErrorsHandler.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case noHTTP
}

enum AppError: Error {
    case network(NetworkError)
    case decoding(DecoderJSONError)
    case unknown(Error)
}

protocol ErrorHandler {
    func handle(error: Error) -> String
}

struct ErrorsHandler {
    public init() {}

    func handleNetworkError(_ error: NetworkError) -> String {
        switch error {
        case .noHTTP:
            return "CONNECTION_ERROR".localized
        case .badResponse:
            return "BAD_RESPONSE_ERROR".localized
        }

        func handleDecoderError(_ error: DecoderJSONError) -> String {
            switch error {
            case .noContent:
                return "NO_CONTENT_ERROR".localized
            case .decodingError:
                return "DECODING_ERROR".localized
            }
        }

        func handleUnknownError(_ error: Error) -> String {
            return "UNKNOWN_ERROR".localized
        }

        func handle(error: Error) -> String {
            switch error {
            case let appError as AppError:
                switch appError {
                case let .network(networkError):
                    return handleNetworkError(networkError)
                case let .decoding(decoderError):
                    return handleDecoderError(decoderError)
                case let .unknown(unknownError):
                    return handleUnknownError(unknownError)
                }
            default:
                return handleUnknownError(error)
            }
        }
    }
}
