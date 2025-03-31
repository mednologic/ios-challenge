//
//  PropertyCell.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyCell: View {
    enum Constants {
        static let heightIphone: CGFloat = 450
        static let heightIpad: CGFloat = 550
    }

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var isFavorited: Bool = false
    @State private var favoriteDate: Date? = nil

    var property: PropertyModel

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
        .frame(height: horizontalSizeClass == .regular ? Constants.heightIpad : Constants.heightIphone)
        .onAppear {
            Task {
                do {
                    isFavorited = try await PersistenceManager.shared.isOnPersistence(property.favoritedProperty(),
                                                                                      in: .favorites)
                    if isFavorited {
                        favoriteDate = property.favoritedProperty().favoriteDate
                    }
                } catch {
                    isFavorited = false
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(property.address), \(property.municipality), \(property.province). " + "PRICE_PREFIX".localized + " \(property.formattedPrice)"))
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
                TextTag(tagText: property.operation.localized)

                TextTag(tagText: property.propertyType.localized)

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
                                try await PersistenceManager.shared.removeToPersistence(property.favoritedProperty(),
                                                                                        from: .favorites)

                            } else {
                                try await PersistenceManager.shared.addToPersistence(property.favoritedProperty(),
                                                                                     to: .favorites)
                            }
                            isFavorited.toggle()
                            favoriteDate = isFavorited ? property.favoritedProperty().favoriteDate : nil
                        }
                    }
                    .padding([.bottom, .trailing], DesignSystem.Spacing.s)
                /// Optional bonus: Accesibility on SwiftUI
                    .accessibilityLabel(isFavorited ? "ACC_FAVORITE_ON_LABEL".localized :
                        "ACC_FAVORITE_OFF_LABEL".localized)
                    .accessibilityHint("ACC_FAVORITE_HINT".localized)
            }
            if let favoriteDate {
                HStack {
                    Text("SAVED_ON".localized + formattedDate(favoriteDate))
                        .captionStyle
                        .padding(.trailing, DesignSystem.Spacing.m)
                }
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

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    PropertyCell(property: .mockPropertyModelRent)
}
