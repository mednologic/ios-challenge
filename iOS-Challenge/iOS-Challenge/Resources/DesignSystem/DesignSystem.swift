//
//  DesignSystem.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI
import UIKit

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

        // For SwiftUI
        static var background: Color { Color(backgroundUIColor) }
        static var primaryText: Color { Color(primaryTextUIColor) }
        static var secondaryText: Color { Color(secondaryTextUIColor) }
        static var primaryYellow: Color { Color(primaryYellowUIColor) }
        static var accentGray: Color { Color(accentGrayUIColor) }
        static var tabBarSelected: Color { Color(tabBarSelectedUIColor) }
        static var tabBarUnselected: Color { Color(tabBarUnselectedUIColor) }
    }

    struct Spacing {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 16
        static let l: CGFloat = 24
        static let xl: CGFloat = 32
    }
}
