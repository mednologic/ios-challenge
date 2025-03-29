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
        let result = NSLocalizedString(self, value: "NoLocalizedString", comment: "")
        return result == "NoLocalizedString" ? self : result
    }
}
