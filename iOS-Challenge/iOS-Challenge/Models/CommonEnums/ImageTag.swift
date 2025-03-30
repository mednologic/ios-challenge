//
//  ImageTag.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
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
    case communalAreas = "communalareas"

    var localized: String {
        switch self {
        case .livingRoom:
            "LIVING_ROOM".localized
        case .unknown:
            "UNKNOWN".localized
        case .views:
            "VIEWS".localized
        case .facade:
            "FACADE".localized
        case .corridor:
            "CORRIDOR".localized
        case .bedroom:
            "BEDROOM".localized
        case .kitchen:
            "KITCHEN".localized
        case .hall:
            "HALL".localized
        case .bathroom:
            "BATHROOM".localized
        case .energyCertification:
            "ENERGY_CERTIFICATION".localized
        case .communalAreas:
            "COMMUNAL_AREAS".localized
        }
    }
}
