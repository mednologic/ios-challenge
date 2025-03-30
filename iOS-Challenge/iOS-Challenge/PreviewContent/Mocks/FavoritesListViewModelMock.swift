//
//  FavoritesListViewModelMock.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

extension FavoritesListViewModel {
    static var mockFavoritesListViewModel: FavoritesListViewModel {
        let mockPropertyRent: PropertyModel = .mockPropertyModelRent
        let mockPropertySale: PropertyModel = .mockPropertyModelSale

        let viewModel = FavoritesListViewModel()
        viewModel.propietiesFavoriteList = [mockPropertyRent, mockPropertySale]
        return viewModel
    }

    static var empty: FavoritesListViewModel {
        let vm = FavoritesListViewModel()
        vm.propietiesFavoriteList = []
        return vm
    }
}
