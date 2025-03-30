//
//  ListView.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyListView: View {
    @ObservedObject var viewModel: PropertyListViewModel
    @State private var showDetails = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: DesignSystem.Spacing.m) {
                    ForEach(viewModel.propietiesList, id: \.propertyCode) { property in
                        PropertyCell(property: property)
                            .onTapGesture {
                                showDetails = true
                            }
                            .padding(.bottom, DesignSystem.Spacing.m)
                    }
                }
                .padding(.top, DesignSystem.Spacing.m)
            }
            .navigationDestination(isPresented: $showDetails) {
                PropertyDetails(property: .mockPropertyDetailModelSell)
            }
        }
        .background(DesignSystem.Colors.background.ignoresSafeArea())
    }
}

#Preview {
    PropertyListView(viewModel: .mockPropertyListViewModel)
        .padding()
}
