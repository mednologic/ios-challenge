//
//  SwipeImageGalley.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct SwipeImageGalley: View {
    enum Constants {
        static let heightIphone: CGFloat = 300
    }

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var selectedImageIndex = 0
    let images: [ImageRepresentableProtocol]

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
        .frame(height: horizontalSizeClass == .regular ? nil : Constants.heightIphone)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("PHOTO_CAROUSEL_LABEL".localized))
        .accessibilityValue(Text(String(format: "PHOTO_COUNT_FORMAT".localized, selectedImageIndex + 1, images.count)))
        .accessibilityHint(Text("PHOTO_CAROUSEL_HINT".localized))
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
