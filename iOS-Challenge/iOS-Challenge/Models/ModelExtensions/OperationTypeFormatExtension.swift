//
//  OperationTypeExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

extension OperationType {
    var localized: String {
        switch self {
        case .sale:
            "SALE".localized
        case .rent:
            "RENT".localized
        default:
            "UNKNOWN".localized
        }
    }
}
