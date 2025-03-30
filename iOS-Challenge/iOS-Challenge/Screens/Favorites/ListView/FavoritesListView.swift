//
//  FavoritesList.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import SwiftUI

struct FavoritesListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var viewModel: FavoritesListViewModel

    var body: some View {
        let favoriteList = viewModel.propertiesFavoriteList

        Group {
            if favoriteList.isEmpty {
                noFavoritesView
                    .background(DesignSystem.Colors.background.ignoresSafeArea())
            } else {
                NavigationStack {
                    ScrollView {
                        adaptiveFavoriteList
                    }
                }
                /// Optional Bonus: Implement pull-to-refresh functionality on the listing screen.
                .refreshable {
                    await viewModel.loadFavorites()
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

    @ViewBuilder
    private var adaptiveFavoriteList: some View {
        if horizontalSizeClass == .regular {
            listOnIpad
        } else {
            listOnIphone
        }
    }

    private var listOnIpad: some View {
        let columns = [
            GridItem(.adaptive(minimum: 400), spacing: DesignSystem.Spacing.m),
        ]

        return LazyVGrid(columns: columns, spacing: DesignSystem.Spacing.m) {
            ForEach(viewModel.propertiesFavoriteList, id: \.propertyCode) { property in
                PropertyCell(property: property)
                    .padding(DesignSystem.Spacing.m)
            }
        }
    }

    private var listOnIphone: some View {
        LazyVStack(spacing: DesignSystem.Spacing.m) {
            ForEach(viewModel.propertiesFavoriteList, id: \.propertyCode) { property in
                PropertyCell(property: property)
                    .padding(.vertical, DesignSystem.Spacing.m)
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
