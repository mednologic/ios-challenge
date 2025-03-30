//
//  PropertyTypeTag.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyTypeTag: View {
    let propertyType: PropertyType

    var body: some View {
        Group {
            if propertyType != .unknown {
                Text(propertyType.localized)
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
    PropertyTypeTag(propertyType: .flat)
    PropertyTypeTag(propertyType: .house)
    PropertyTypeTag(propertyType: .studio)
    PropertyTypeTag(propertyType: .villa)
    PropertyTypeTag(propertyType: .unknown)
}
