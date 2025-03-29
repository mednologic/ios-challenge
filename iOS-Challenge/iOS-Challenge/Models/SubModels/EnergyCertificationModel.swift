//
//  EnergyCertificationModel.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

struct EnergyCertificationModel: Codable {
    let title: String
    let energyConsumption: EnergyTypeModel
    let emissions: EnergyTypeModel
}
