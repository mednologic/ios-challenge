//
//  ImageModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

enum ImageTag: String, Codable, CaseIterable {
    case livingRoom
    case unknown
    case views
    case facade
    case corridor
    case bedroom
    case kitchen
    case hall
    case bathroom
    case energyCertification
    case communalAreas

    var localized: String {
        switch self {
        case .livingRoom:
            return "LIVING_ROOM".localized
        case .unknown:
            return "UNKNOWN".localized
        case .views:
            return "VIEWS".localized
        case .facade:
            return "FACADE".localized
        case .corridor:
            return "CORRIDOR".localized
        case .bedroom:
            return "BEDROOM".localized
        case .kitchen:
            return "KITCHEN".localized
        case .hall:
            return "HALL".localized
        case .bathroom:
            return "BATHROOM".localized
        case .energyCertification:
            return "ENERGY_CERTIFICATION".localized
        case .communalAreas:
            return "COMMUNAL_AREAS".localized
        }
    }
}

struct ImageModel: Codable {
    let url: String
    let tag: ImageTag
    let localizedName: String?
    let multimediaId: Int?

    init(url: String, tag: ImageTag, localizedName: String? = nil, multimediaId: Int? = nil) {
        self.url = url
        self.tag = tag
        self.localizedName = localizedName
        self.multimediaId = multimediaId
    }
}
