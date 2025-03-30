//
//  MockData.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import Foundation

extension Data {
    static let mockInvalidJSON = """
    {
        "thumbnail": "https://example.com/image.jpg"
    }
    """.data(using: .utf8)!

    static let mockPropertyDetailJSON: Data = """
    {
        "propertyCode": "123",
        "thumbnail": "https://example.com/image.jpg",
        "floor": "1",
        "price": 120000.0,
        "priceInfo": {
            "price": {
                "amount": 120000.0,
                "currencySuffix": "€"
            }
        },
        "propertyType": "flat",
        "operation": "sale",
        "size": 80.0,
        "exterior": true,
        "rooms": 3,
        "bathrooms": 2,
        "address": "123 Main St",
        "province": "Barcelona",
        "municipality": "Barcelona",
        "district": "Eixample",
        "country": "Spain",
        "neighborhood": "Dreta de l'Eixample",
        "latitude": 41.3851,
        "longitude": 2.1734,
        "description": "Nice flat downtown",
        "multimedia": null,
        "features": null,
        "parkingSpace": null
    }
    """.data(using: .utf8)!
}
