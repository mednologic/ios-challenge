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
                    .font(.system(size: DSSizesText.caption.rawValue, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
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
