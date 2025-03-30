//
//  DesignSystem.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI
import UIKit

/// Optional Bonus: Add support for Dark Mode to ensure the app looks great in all environments.
/// with this DesignSystem and the assets, we can easily switch between light and darkmode
struct DesignSystem {
    struct Colors {
        // For UIkit
        static let backgroundUIColor = UIColor(named: "Background") ?? .systemBackground
        static let primaryTextUIColor = UIColor(named: "PrimaryText") ?? .label
        static let secondaryTextUIColor = UIColor(named: "SecondaryText") ?? .secondaryLabel
        static let primaryYellowUIColor = UIColor(named: "PrimaryYellow") ?? .systemYellow
        static let accentGrayUIColor = UIColor(named: "AccentGray") ?? .systemGray6
        static let tabBarSelectedUIColor = UIColor(named: "TabBarSelected") ?? .yellow
        static let tabBarUnselectedUIColor = UIColor(named: "TabBarUnselected") ?? .gray
        static let contrastTextColor = UIColor(named: "ContrastText") ?? .white
        static let shadowColor = UIColor(named: "ShadowColor") ?? .black
        static let tagColor = UIColor(named: "Tag") ?? .black
        static let actionColorDS = UIColor(named: "Action") ?? .blue
        static let tagTextColor = UIColor(named: "TagText") ?? .white

        // For SwiftUI
        static var background: Color { Color(backgroundUIColor) }
        static var primaryText: Color { Color(primaryTextUIColor) }
        static var secondaryText: Color { Color(secondaryTextUIColor) }
        static var primaryYellow: Color { Color(primaryYellowUIColor) }
        static var accentGray: Color { Color(accentGrayUIColor) }
        static var tabBarSelected: Color { Color(tabBarSelectedUIColor) }
        static var tabBarUnselected: Color { Color(tabBarUnselectedUIColor) }
        static var contrastText: Color { Color(contrastTextColor) }
        static var shadow: Color { Color(shadowColor) }
        static var tag: Color { Color(tagColor).opacity(0.4) }
        static var actionDS: Color { Color(actionColorDS) }
        static var tagText: Color { Color(tagTextColor) }
    }

    struct Spacing {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 16
        static let l: CGFloat = 24
        static let xl: CGFloat = 32
    }

    struct CornerRadius {
        static let m: CGFloat = 8
    }

    struct Shadows {
        static let cardShadowColor: Color = DesignSystem.Colors.shadow.opacity(0.2)
        static let cardShadowRadius: CGFloat = 4
        static let cardShadowX: CGFloat = 0
        static let cardShadowY: CGFloat = 2
    }

    struct CardShadowModifier: ViewModifier {
        @Environment(\.colorScheme) var colorScheme

        func body(content: Content) -> some View {
            content.shadow(
                color: DesignSystem.Colors.shadow.opacity(0.5),
                radius: DesignSystem.Shadows.cardShadowRadius,
                x: DesignSystem.Shadows.cardShadowX,
                y: DesignSystem.Shadows.cardShadowY
            )
        }
    }
}
