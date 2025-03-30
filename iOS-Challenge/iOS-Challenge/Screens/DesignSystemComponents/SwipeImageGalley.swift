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
                        if !images.isEmpty {
                            FotoCountTag(total: images.count, index: selectedImageIndex)
                                .padding([.trailing, .bottom], DesignSystem.Spacing.s)
                        }
                    }
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 300)
    }
}

#Preview {
    SwipeImageGalley(
        images: [
            ImageModel.mockImageModel,
            ImageModel.mockImageModel
        ]
    )
}
