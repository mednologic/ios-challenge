//
//  SwipeImageGalley.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct SwipeImageGalley: View {
    let images: [ImageRepresentableProtocol]

    @State private var selectedImageIndex = 0

    var body: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(images.indices, id: \.self) { index in
                ImageView(urlString: images[index].url)
                    .overlay(alignment: .bottomTrailing) {
                        photoCountTagView()
                    }
                    .tag(index)
                    .overlay(alignment: .topLeading) {
                        roomTagView(for: index)
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 300)
    }

    @ViewBuilder
    private func photoCountTagView() -> some View {
        if !images.isEmpty {
            FotoCountTag(total: images.count, index: selectedImageIndex)
                .padding([.trailing, .bottom], DesignSystem.Spacing.s)
        }
    }

    @ViewBuilder
    private func roomTagView(for index: Int) -> some View {
        if images.indices.contains(index), images[index].tag != .unknown {
            TextTag(tagText: images[index].tag.localized)
                .padding([.leading, .top], DesignSystem.Spacing.s)
        }
    }
}

#Preview {
    SwipeImageGalley(
        images: [
            ImageModel.mockImageModel,
            ImageModel.mockImageModel,
        ]
    )
}
