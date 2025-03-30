//
//  MockPropietiesDataRepository.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

@testable import iOS_Challenge

struct MockPropietiesDataRepository: PropietiesDataRepositoryProtocol {
    var listResult: () async throws -> [PropertyModel]
    var detailResult: () async throws -> PropertyDetailModel

    func fetchPropietiesList() async throws -> [PropertyModel] {
        try await listResult()
    }

    func fecthPropietyDetail() async throws -> PropertyDetailModel {
        try await detailResult()
    }
}
