//
//  ListView.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

/// Optional Bonus: Incorporate some SwiftUI code alongside UIKit.
struct PropertyListView: View {
    @ObservedObject var viewModel: PropertyListViewModel
    @State private var showDetails = false
    @State private var selectedDetail: PropertyDetailModel?

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: DesignSystem.Spacing.m) {
                    ForEach(viewModel.propertiesList, id: \.propertyCode) { property in
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
}

#Preview {
    PropertyListView(viewModel: .mockPropertyListViewModel)
        .padding()
}
