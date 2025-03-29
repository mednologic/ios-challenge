//
//  EnergyTypeModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

enum EnergyType: String, Codable, CaseIterable {
    case A = "a"
    case B = "b"
    case C = "c"
    case D = "d"
    case E = "e"
    case F = "f"
    case G = "g"
    case unknown = "unknown"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self).lowercased()
        self = EnergyType(rawValue: rawValue) ?? .unknown
    }
}

struct EnergyTypeModel: Codable {
    let type: EnergyType
}
