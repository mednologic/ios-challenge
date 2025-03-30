//
//  FavoritesListViewModel.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

@MainActor
class FavoritesListViewModel: ObservableObject {
    @Published var propietiesFavoriteList: [PropertyModel] = []

    func loadFavorites() async {
        do {
            let favoritedProperties: [FavoritedProperty] = try await PersistenceManager.shared.load(from: .favorites,
                                                                                                    as: [FavoritedProperty].self)
            propietiesFavoriteList = favoritedProperties.map { $0.property }
        } catch {
            propietiesFavoriteList = []
        }
    }
}
