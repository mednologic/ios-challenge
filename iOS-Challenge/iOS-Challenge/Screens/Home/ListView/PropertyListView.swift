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
            VStack {
                if let firstProperty = viewModel.propietiesList.first {
                    Text("Address: \(firstProperty.address)")
                        .foregroundStyle(DesignSystem.Colors.primaryText)
                } else {
                    Text("No properties available.")
                }
            }
            .padding()
        }

    }
}
