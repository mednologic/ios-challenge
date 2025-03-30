//
//  ListViewModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

@MainActor
class PropertyListViewModel: ObservableObject {
    @Published var propietiesList: [PropertyModel] = []
    @Published var propietyDetail: PropertyDetailModel?
    private let repository: PropietiesDataRepositoryProtocol

    init(repository: PropietiesDataRepositoryProtocol) {
        self.repository = repository
        Task {
            try await fetchList()
        }
    }

    func fetchList() async throws {
        propietiesList = try await repository.fetchPropietiesList()
    }

    func fetchDetail() async throws -> PropertyDetailModel {
        try await repository.fecthPropietyDetail()
    }
}
