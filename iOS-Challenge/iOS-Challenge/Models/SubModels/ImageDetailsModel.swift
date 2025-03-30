//
//  ImageDetailsModel.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

struct ImageDetailsModel: Codable, ImageRepresentableProtocol {
    let url: String
    let tag: ImageTag
    let localizedName: String?
    let multimediaId: Int?
}
