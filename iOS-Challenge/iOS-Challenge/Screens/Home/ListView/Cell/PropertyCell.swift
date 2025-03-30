//
//  PropertyCell.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyCell: View {
    var property: PropertyModel
    @State private var isFavorited: Bool = false

    var body: some View {
        ZStack {
            DesignSystem.Colors.accentGray
            VStack(alignment: .leading) {
                propertyImages
                    .padding(.bottom, DesignSystem.Spacing.s)

                propertyInfoDetailsSection
                    .padding(.leading, DesignSystem.Spacing.m)

                Spacer()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.m)
                .stroke(Color.black, lineWidth: 1)
                .cardShadow()
        )
        .padding(.horizontal, DesignSystem.Spacing.s)
        .frame(height: 450)
        .onAppear {
            Task {
                do {
                    isFavorited = try await PersistenceManager.shared.isOnPersistence(property, in: .favorites)
                } catch {
                    isFavorited = false
                }
            }
        }
    }

    @ViewBuilder
    private var propertyImages: some View {
        if let images = property.multimedia?.images {
            SwipeImageGalley(images: images)
        } else {
            ImageView(urlString: property.thumbnail)
        }
    }

    private var propertyInfoDetailsSection: some View {
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
                Image(systemName: isFavorited ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(.red)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, DesignSystem.Spacing.s)
                    .onTapGesture {
                        Task {
                            if isFavorited {
                                try await PersistenceManager.shared.removeToPersistence(property, from: .favorites)

                            } else {
                                try await PersistenceManager.shared.addToPersistence(property, to: .favorites)
                            }
                            isFavorited.toggle()
                        }
                    }
                    .padding(.bottom, DesignSystem.Spacing.s)
                    .padding(.trailing, DesignSystem.Spacing.s)
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
