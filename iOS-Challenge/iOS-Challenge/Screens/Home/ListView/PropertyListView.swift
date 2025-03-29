//
//  ListView.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyListView: View {
    @ObservedObject var viewModel: PropertyListViewModel

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: DesignSystem.Spacing.m) {
                    ForEach(viewModel.propietiesList, id: \.propertyCode) { property in
                        PropertyCell(property: property)
                    }
                }
            }
        }
    }
}
#Preview {
    PropertyListView(viewModel: .mockPropertyListViewModel)
        .padding()
}
