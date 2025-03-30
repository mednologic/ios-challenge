//
//  PropertyTypeTag.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct TextTag: View {
    let tagText: String

    var body: some View {
        Group {
            if tagText != "unknown" {
                Text(tagText)
                    .tagStyle
                    .padding(.horizontal, DesignSystem.Spacing.s)
                    .padding(.vertical, DesignSystem.Spacing.xs)
                    .background(
                        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
                            .fill(DesignSystem.Colors.tag)
                    )
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    TextTag(tagText: "Flat")
}
