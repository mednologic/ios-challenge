//
//  TextUIKitExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import UIKit

extension UILabel {
    func applyTitleStyle() {
        self.font = UIFont.systemFont(ofSize: DSSizesText.title.rawValue, weight: .bold)
        self.textColor = DesignSystem.Colors.primaryTextUIColor
    }

    func applySubtitleStyle() {
        self.font = UIFont.systemFont(ofSize: DSSizesText.subtitle.rawValue, weight: .semibold)
        self.textColor = DesignSystem.Colors.secondaryTextUIColor
    }

    func applyBodyStyle() {
        self.font = UIFont.systemFont(ofSize: DSSizesText.body.rawValue, weight: .regular)
        self.textColor = DesignSystem.Colors.primaryTextUIColor
    }

    func applyCaptionStyle() {
        self.font = UIFont.systemFont(ofSize: DSSizesText.caption.rawValue, weight: .regular)
        self.textColor = DesignSystem.Colors.secondaryTextUIColor
    }
}
