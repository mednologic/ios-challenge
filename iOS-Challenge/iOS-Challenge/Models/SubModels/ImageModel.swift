//
//  ImageModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

enum ImageTag: String, Codable, CaseIterable {
    case livingRoom = "livingRoom"
    case unknown = "unknown"
    case views = "views"
    case facade = "facade"
    case corridor = "corridor"
    case bedroom = "bedroom"
    case kitchen = "kitchen"
    case hall = "hall"
    case bathroom = "bathroom"
    case energyCertification = "energyCertification"
}


struct ImageModel: Codable {
    let url: String
    let tag: ImageTag
}
