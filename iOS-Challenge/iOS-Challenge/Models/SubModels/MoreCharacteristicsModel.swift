//
//  MoreCharacteristicsModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//
import SwiftUI

enum PropertyStatus: String, Codable, CaseIterable {
    case new
    case renew
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self).lowercased()
        self = PropertyStatus(rawValue: rawValue) ?? .unknown
    }

    var localized: String {
        switch self {
        case .new:
            "STATUS_NEW".localized
        case .renew:
            "STATUS_RENEW".localized
        case .unknown:
            "STATUS_UNKNOWN".localized
        }
    }
}

struct MoreCharacteristicsModel: Codable {
    let communityCosts: Double?
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: Int64
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let floor: String
    let status: PropertyStatus
}

extension MoreCharacteristicsModel {
    var formattedCommunityCosts: String? {
        guard let communityCosts = communityCosts else { return nil }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0

        return formatter.string(from: NSNumber(value: communityCosts))
    }
}
