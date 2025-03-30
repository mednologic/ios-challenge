//
//  PropertyListViewModelTests.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

@testable import iOS_Challenge
import Testing

struct PropertyListViewModelTests {
    enum TestError: Error, Equatable {
        case fakeError
    }

    func makeSUT(
        listResult: @escaping () async throws -> [PropertyModel] = { [] },
        detailResult: @escaping () async throws -> PropertyDetailModel = { .mockPropertyDetailModelSell }
    ) async -> PropertyListViewModel {
        let mock = MockPropietiesDataRepository(
            listResult: listResult,
            detailResult: detailResult
        )
        let viewModel = await PropertyListViewModel(repository: mock)
        try? await Task.sleep(nanoseconds: 50000000)
        return viewModel
    }

    @Test("Should load property list successfully")
    func test_fetchList_success() async throws {
        let expectedList = [
            PropertyModel.mockPropertyModelRent,
            PropertyModel.mockPropertyModelSale,
        ]

        let viewModel = await makeSUT(listResult: { expectedList })
        await #expect(viewModel.propietiesList == expectedList)
    }

    @Test("Should throw error when property list loading fails")
    func test_fetchList_failure() async {
        let viewModel = await makeSUT(listResult: { throw TestError.fakeError })

        await #expect(throws: TestError.fakeError) {
            try await viewModel.fetchList()
        }
    }

    @Test("Should throw error when property detail loading fails")
    func test_fetchDetail_failure() async {
        let viewModel = await makeSUT(detailResult: { throw TestError.fakeError })

        await #expect(throws: TestError.fakeError) {
            _ = try await viewModel.fetchDetail()
        }
    }
}
