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
            return "No es un http" // TODO: translation when languages ara added
        case .badResponse:
            return "Error en respuesta"// TODO: translation when languages ara added
        }

        func handleDecoderError(_ error: DecoderJSONError) -> String {
            switch error {
            case .noContent:
                return "No hay contenido disponible."// TODO: translation when languages ara added
            case .decodingError(let innerError):
                return "Error de decodificación: \(innerError.localizedDescription)"// TODO: translation when languages ara added
            }
        }

        func handleUnknownError(_ error: Error) -> String {
            return "Error desconocido: \(error.localizedDescription)"// TODO: translation when languages ara added
        }

        func handle(error: Error) -> String {
            switch error {
            case let appError as AppError:
                switch appError {
                case .network(let networkError):
                    return handleNetworkError(networkError)
                case .decoding(let decoderError):
                    return handleDecoderError(decoderError)
                case .unknown(let unknownError):
                    return handleUnknownError(unknownError)
                }
            default:
                return handleUnknownError(error)
            }
        }
    }
}
