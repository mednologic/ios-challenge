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
        VStack {
            if let firstProperty = viewModel.propietiesList.first {
                Text("Address: \(firstProperty.address)")
            } else {
                Text("No properties available.")
            }
        }
        .padding()
    }
}
