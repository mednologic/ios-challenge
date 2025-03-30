//
//  ImageModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

struct ImageModel: Codable, ImageRepresentableProtocol {
    let url: String
    let tag: ImageTag
}
