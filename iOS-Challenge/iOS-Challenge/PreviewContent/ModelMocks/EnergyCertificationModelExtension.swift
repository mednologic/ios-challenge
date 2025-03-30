//
//  EnergyCertificationModelExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

/// Optional bonus: Preview content rehusable for tests and mocks and itsnt uploaded to release by project configuration
extension EnergyCertificationModel {
    static let mockEnergyCertificationModel = EnergyCertificationModel(
        title: "Certificado energético",
        energyConsumption: .mockEnergyTypeModel,
        emissions: .mockEnergyTypeModel)
}
