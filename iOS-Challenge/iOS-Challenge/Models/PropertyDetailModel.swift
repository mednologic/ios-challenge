//
//  PropertyDetailModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

struct PropertyDetailModel: Codable {
    let adid: Int
    let price: Double
    let priceInfo: PriceInfoModel
    let operation: OperationType
    let propertyType: PropertyType
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: [ImageModel]
    let propertyComment: String
    let ubication: UbicationModel
    let country: String
    let moreCharacteristics: MoreCharacteristicsModel
    let energyCertification: EnergyCertificationModel
}

extension PropertyDetailModel {
    var formattedPrice: String {
        PriceFormatter.format(amount: priceInfo.amount, currencySuffix: priceInfo.currencySuffix)
    }
}
