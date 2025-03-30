//
//  StringExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        let result = NSLocalizedString(self, comment: "")
        /// Allows to see more directly on the inteface when a string is not localized
        return result == self ? "⚠️⚠️⚠️⚠️[\(self)]" : result
    }
}
