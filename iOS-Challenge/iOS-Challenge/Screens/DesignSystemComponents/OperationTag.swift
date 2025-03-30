//
//  OperationTag.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct OperationTag: View {
    let operationType: OperationType

    var body: some View {
        Group {
            if operationType != .unknown {
                Text(operationType.localized)
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
    OperationTag(operationType: .rent)
    OperationTag(operationType: .sale)
    OperationTag(operationType: .unknown)
}
