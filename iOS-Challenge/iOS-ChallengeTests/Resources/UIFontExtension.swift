//
//  UIFontExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import UIKit

/// Extracts the weight (UIFont.Weight) of a UIFont instance by inspecting its fontDescriptor traits.
/// This allows unit tests or runtime checks to compare font weights (e.g., .bold, .regular),
/// since UIFont does not expose its weight directly.
///
/// - Returns: A `UIFont.Weight` value based on the font descriptor, or `.regular` if unavailable.
extension UIFont {
    var weight: UIFont.Weight {
        let traits = fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any]
        let raw = traits?[.weight] as? CGFloat ?? 0
        return UIFont.Weight(rawValue: raw)
    }
}
