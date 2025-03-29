//
//  PropertyCell.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyCell: View {
    var property: PropertyModel

    var body: some View {
        ZStack {
            DesignSystem.Colors.accentGray
            VStack(alignment: .leading) {
                ImageView(urlString: property.thumbnail)
                    .overlay(alignment: .bottomTrailing) {
                        if let media = property.multimedia?.images, !media.isEmpty {
                            FotoCountTag(count: media.count)
                                .padding([.trailing, .bottom], DesignSystem.Spacing.s)
                        }
                    }
                    .padding(.bottom, DesignSystem.Spacing.s)
                propertyDetailsSection
                    .padding(.leading, DesignSystem.Spacing.m)
                Spacer()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.horizontal, DesignSystem.Spacing.s)
        .frame(height: 450)
        .cardShadow()
    }

    private var propertyDetailsSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {

            Text(property.address)
                .bodyStyle

            Text("\(property.municipality), \(property.province)")
                .bodyStyle

            HStack {
                Text(property.formattedPrice)
                    .amountStyle

                if property.parkingSpace?.hasParkingSpace == true {
                    parkingText
                }
            }
            HStack {
                Text(property.formattedRooms)
                    .bodyStyle

                Text(property.formattedSize)
                    .bodyStyle

                floorAndType
            }
            HStack {
                OperationTag(operationType: property.operation)
                PropertyTypeTag(propertyType: property.propertyType)
                Spacer()
            }
        }
    }

    @ViewBuilder
    private var parkingText: some View {
        if let isIncluded = property.parkingSpace?.isParkingSpaceIncludedInPrice {
            Text(isIncluded ? "PARKING_INCLUDED".localized : "PARKING_OPTIONAL".localized)
                .bodyStyle
        }
    }

    private var floorAndType: some View {
        HStack {
            if let floor = property.floor {
                Text("PLANTA".localized + " " + floor)
                    .bodyStyle
            }
            if let isExterior = property.exterior {
                Text(isExterior ? "EXTERIOR".localized : "INTERIOR".localized)
                    .bodyStyle
            }
        }
    }
}

#Preview {
    PropertyCell(property: .mockPropertyModelRent)
}
