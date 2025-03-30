//
//  PropertyTypeFormatterExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

extension PropertyType {
    var localized: String {
        switch self {
        case .flat:
            return "FLAT".localized
        case .house:
            return "HOUSE".localized
        case .villa:
            return "VILLA".localized
        case .studio:
            return "STUDIO".localized
        case .unknown:
            return "UNKNOWN".localized
        }
    }
}
