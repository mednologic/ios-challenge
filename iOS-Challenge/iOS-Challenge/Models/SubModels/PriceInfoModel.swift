//
//  PriceInfoModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PriceInfoModel: Codable {
    let amount: Double
    let currencySuffix: String
}

extension PriceInfoModel {
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedAmount = formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        return formattedAmount + " " + currencySuffix
    }
}
