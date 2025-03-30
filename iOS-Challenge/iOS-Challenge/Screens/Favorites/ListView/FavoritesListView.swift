//
//  FavoritesList.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

struct FavoritesListView: View {
    @ObservedObject var viewModel: FavoritesListViewModel

    var body: some View {
        let favoriteList = viewModel.propietiesFavoriteList

        Group {
            if favoriteList.isEmpty {
                noFavoritesView
                    .background(DesignSystem.Colors.background.ignoresSafeArea())
            } else {
                NavigationStack {
                    ScrollView {
                        LazyVStack(spacing: DesignSystem.Spacing.m) {
                            ForEach(favoriteList, id: \.propertyCode) { property in
                                PropertyCell(property: property)
                                    .padding(.bottom, DesignSystem.Spacing.m)
                                    .padding(.top, DesignSystem.Spacing.m)
                            }
                        }
                    }
                }
                .background(DesignSystem.Colors.background.ignoresSafeArea())
            }
        }
        .onAppear {
            Task {
                await viewModel.loadFavorites()
            }
        }
    }

    private var noFavoritesView: some View {
        VStack {
            Spacer()

            Text("NO_FAVORITES".localized)
                .titleStyle

            Spacer()
        }
    }
}

#Preview {
    FavoritesListView(viewModel: .mockFavoritesListViewModel)
}
