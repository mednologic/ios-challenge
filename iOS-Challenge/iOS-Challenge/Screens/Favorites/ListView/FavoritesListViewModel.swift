//
//  FavoritesListViewModel.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

@MainActor
class FavoritesListViewModel: ObservableObject {
    @Published var propertiesFavoriteList: [PropertyModel] = []

    func loadFavorites() async {
        do {
            let favoritedProperties = try await PersistenceManager.shared.load(from: .favorites,
                                                                               as: [FavoritedProperty].self)
            propertiesFavoriteList = favoritedProperties.map { $0.property }
        } catch {
            propertiesFavoriteList = []
        }
    }
}
