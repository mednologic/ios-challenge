//
//  MoreCharacteristicsModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//
import SwiftUI

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
    let status: String
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
