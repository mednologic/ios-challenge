//
//  PropertyModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

enum PropertyType: String, Codable, CaseIterable {
    case flat
    case house
    case villa
    case studio
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self).lowercased()
        self = PropertyType(rawValue: rawValue) ?? .unknown
    }
}

enum OperationType: String, Codable, CaseIterable {
    case sale
    case rent
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self).lowercased()
        self = OperationType(rawValue: rawValue) ?? .unknown
    }
}

struct PropertyModel: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String?
    let price: Double
    let priceInfo: PriceInfoListModel
    let propertyType: PropertyType
    let operation: OperationType
    let size: Double
    let exterior: Bool?
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String?
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: MultimediaModel?
    let features: FeaturesModel?
    let parkingSpace: ParkingSpaceModel?
}

extension PropertyModel {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","

        formatter.maximumFractionDigits = operation == .rent ? 2 : 0
        formatter.minimumFractionDigits = operation == .rent ? 2 : 0

        let amount = priceInfo.price.amount
        let formatted = formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"

        return formatted + " " + priceInfo.price.currencySuffix
    }

    var formattedPriceWithSuffix: String {
        if operation == .rent {
            return formattedPrice + " /mes"
        } else {
            return formattedPrice
        }
    }

    var formattedSize: String {
        String(format: "%.0f m²", size)
    }

    var formattedRooms: String {
        "\(rooms) \("ROOMS".localized)"
    }
}
