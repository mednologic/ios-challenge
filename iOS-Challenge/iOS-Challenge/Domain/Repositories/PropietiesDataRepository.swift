//
//  PropietiesDataRepository.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation

protocol PropietiesDataRepositoryProtocol {
    func fetchPropietiesList() async throws -> [PropertyModel]
}

final class PropietiesDataRepository: PropietiesDataRepositoryProtocol {
    let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func fetchPropietiesList() async throws -> [PropertyModel] {
        try await networkService.getJSONToModel(request: .get(url: .getList), type: [PropertyModel].self)
    }
}
