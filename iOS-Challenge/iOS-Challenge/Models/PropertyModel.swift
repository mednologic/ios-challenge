//
//  PropertyModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

enum PropertyType: String, Codable, CaseIterable {
    case flat = "flat"
    case house = "house"
    case villa = "villa"
    case studio = "studio"
    case unknown = "unknown"
}

enum OperationType: String, Codable, CaseIterable {
    case sale = "sale"
    case rent = "rent"
    case unknown = "unknown"
}

struct PropertyModel: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String?
    let price: Double
    let priceInfo: PriceInfoModel
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
}


