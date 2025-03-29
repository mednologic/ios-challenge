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
}

struct EnergyTypeModel: Codable {
    let type: EnergyType
}
