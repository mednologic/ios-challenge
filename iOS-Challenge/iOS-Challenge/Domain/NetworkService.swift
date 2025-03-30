//
//  NetworkService.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation


/// Optional bonus: Data layer for calls
protocol NetworkServiceProtocol {
    func getJSONToModel<T>(request: URLRequest, type: T.Type) async throws -> T where T: Codable
}

final class NetworkService: NetworkServiceProtocol {
    public static let shared = NetworkService()

    public func getJSONToModel<T>(request: URLRequest, type: T.Type) async throws -> T where T: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                AlertPresenter.showAlert(title: "ERROR".localized, message: "BAD_RESPONSE_ERROR".localized)
                throw error
            }
        } else {
            AlertPresenter.showAlert(title: "ERROR".localized, message: "BAD_RESPONSE_ERROR".localized)
            throw NetworkError.badResponse
        }
    }
}
