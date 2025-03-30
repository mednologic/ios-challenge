//
//  FotoCountTag.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct FotoCountTag: View {
    enum Constants {
        static let sizeWidth: CGFloat = 45
        static let sizeHeight: CGFloat = 30
    }

    let total: Int
    let index: Int

    var body: some View {
        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
            .fill(DesignSystem.Colors.tag)
            .frame(width: Constants.sizeWidth, height: Constants.sizeHeight)
            .overlay {
                Text("\(index + 1)/\(total)")
                    .tagStyle
            }
    }
}

#Preview {
    FotoCountTag(total: 12, index: 11)
}
