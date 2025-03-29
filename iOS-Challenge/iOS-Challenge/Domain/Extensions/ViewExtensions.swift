//
//  ViewExtensions.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

extension View {
    func cardShadow() -> some View {
        self.modifier(DesignSystem.CardShadowModifier())
    }
}
