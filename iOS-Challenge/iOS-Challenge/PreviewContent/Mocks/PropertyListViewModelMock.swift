//
//  PropertyListViewModelMock.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

extension PropertyListViewModel {
    static var mockPropertyListViewModel: PropertyListViewModel {
        let mockProperty: PropertyModel = .mockPropertyModelRent

        let viewModel = PropertyListViewModel(repository: MockRepository())
        viewModel.propietiesList = [mockProperty]
        return viewModel
    }
}

class MockRepository: PropietiesDataRepositoryProtocol {
    func fetchPropietiesList() async throws -> [PropertyModel] {
        [.mockPropertyModelRent, .mockPropertyModelRent]
    }
}
