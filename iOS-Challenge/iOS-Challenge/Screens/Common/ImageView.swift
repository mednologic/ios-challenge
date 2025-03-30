//
//  ImageView.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct ImageView: View {
    enum Constants {
        static let heightIphone: CGFloat = 300
        static let heightIpad: CGFloat = 500
    }

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var image: UIImage?
    @State private var isLoading = true

    let urlString: String?
    private let imageManager = ImageManager()

    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
            } else if isLoading {
                ProgressView()
            } else {
                Image(.imagePlaceHolder)
                    .resizable()
            }
        }
        .clipped()
        .frame(height: horizontalSizeClass == .regular ? Constants.heightIpad : Constants.heightIphone)
        .cornerRadius(DesignSystem.CornerRadius.m)
        .task {
            await loadImage()
        }
    }

    private func loadImage() async {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            isLoading = false
            return
        }

        Task {
            image = try await imageManager.getImageFromURL(url: url)
        }

        isLoading = false
    }
}

#Preview {
    ImageView(urlString: PropertyModel.mockPropertyModelRent.thumbnail)
        .padding()
}
