//
//  FotoCountTag.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct FotoCountTag: View {
    enum Constants {
        static let size: CGFloat = 30
    }

    let count: Int

    var body: some View {
        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
            .fill(DesignSystem.Colors.tag)
            .frame(width: Constants.size, height: Constants.size)
            .overlay {
                Text("\(count)")
                    .foregroundStyle(DesignSystem.Colors.contrastText)
            }
    }
}

#Preview {
    FotoCountTag(count: 2)
}
