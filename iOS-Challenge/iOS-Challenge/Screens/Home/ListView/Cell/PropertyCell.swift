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
                            fotoCountTag(count: media.count)
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
        .padding(.leading, DesignSystem.Spacing.s)
        .frame(height: 450)
        .cardShadow()
    }

    private var propertyDetailsSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            Text(property.address)
                .font(.headline)

            Text("\(property.municipality), \(property.province)")
                .font(.subheadline)

            HStack {
                Text(property.formattedPriceWithSuffix)
                    .amountStyle

                if property.parkingSpace?.hasParkingSpace == true {
                    parkingText
                }
            }
            HStack {
                Text(property.formattedRooms)

                Text(property.formattedSize)

                if let floor = property.floor {
                    Text("\("PLANTA".localized) \(floor)")
                }
            }
        }
    }

    @ViewBuilder
    private var parkingText: some View {
        if let isIncluded = property.parkingSpace?.isParkingSpaceIncludedInPrice {
            Text(isIncluded ? "PARKING_INCLUDED".localized : "PARKING_OPTIONAL".localized)
        }
    }

    private func fotoCountTag(count: Int) -> some View {
        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
            .frame(width: 30, height: 30)
            .overlay {
                Text(String(count))
                    .foregroundStyle(.contrastText)
            }
    }
}

#Preview {
    PropertyCell(property: .mockPropertyModelRent)
}
