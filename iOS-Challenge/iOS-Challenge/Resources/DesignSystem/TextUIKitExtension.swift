//
//  TextUIKitExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import UIKit

extension UILabel {
    func applyTitleStyle() {
        font = UIFont.systemFont(ofSize: DSSizesText.title.rawValue, weight: .bold)
        textColor = DesignSystem.Colors.primaryTextUIColor
    }

    func applySubtitleStyle() {
        font = UIFont.systemFont(ofSize: DSSizesText.subtitle.rawValue, weight: .semibold)
        textColor = DesignSystem.Colors.secondaryTextUIColor
    }

    func applyBodyStyle() {
        font = UIFont.systemFont(ofSize: DSSizesText.body.rawValue, weight: .regular)
        textColor = DesignSystem.Colors.primaryTextUIColor
    }

    func applyCaptionStyle() {
        font = UIFont.systemFont(ofSize: DSSizesText.caption.rawValue, weight: .regular)
        textColor = DesignSystem.Colors.secondaryTextUIColor
    }
}
