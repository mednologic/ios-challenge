//
//  ListView.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

/// Optional Bonus: Incorporate some SwiftUI code alongside UIKit.
struct PropertyListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var viewModel: PropertyListViewModel
    @State private var showDetails = false
    @State private var selectedDetail: PropertyDetailModel?

    var body: some View {
        NavigationStack {
            ScrollView {
                adaptivePropertyList
                    .padding(.top, DesignSystem.Spacing.m)
            }
            /// Optional Bonus: Implement pull-to-refresh functionality on the listing screen.
            .refreshable {
                do {
                    try await viewModel.fetchList()
                } catch {
                    AlertPresenter.showAlert(title: "ERROR".localized, message: "BAD_RESPONSE_ERROR".localized)
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                if let detail = selectedDetail {
                    PropertyDetails(property: detail)
                } else {
                    ProgressView("Cargando detalle...")
                }
            }
        }
        .background(DesignSystem.Colors.background.ignoresSafeArea())
    }

    @ViewBuilder
    private var adaptivePropertyList: some View {
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
            ForEach(viewModel.propertiesList, id: \.propertyCode) { property in
                cellView(for: property)
                    .frame(maxWidth: 400)
                    .padding(DesignSystem.Spacing.m)
            }
        }
    }

    private var listOnIphone: some View {
        LazyVStack(spacing: DesignSystem.Spacing.m) {
            ForEach(viewModel.propertiesList, id: \.propertyCode) { property in
                cellView(for: property)
                    .padding(.vertical, DesignSystem.Spacing.m)
            }
        }
    }

    private func cellView(for property: PropertyModel) -> some View {
        PropertyCell(property: property)
            .onTapGesture {
                Task {
                    do {
                        let detail = try await viewModel.fetchDetail()
                        selectedDetail = detail
                        showDetails = true
                    } catch {
                        AlertPresenter.showAlert(title: "ERROR".localized,
                                                 message: "BAD_RESPONSE_ERROR".localized)
                    }
                }
            }
            .padding(.bottom, DesignSystem.Spacing.m)
    }
}

#Preview {
    PropertyListView(viewModel: .mockPropertyListViewModel)
        .padding()
}
