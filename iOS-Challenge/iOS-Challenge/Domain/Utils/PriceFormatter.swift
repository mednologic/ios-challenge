//
//  PriceFormatter.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PriceFormatter {
    static func format(amount: Double, currencySuffix: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formatted = formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        return formatted + " " + currencySuffix
    }
}
