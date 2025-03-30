//
//  PropertyDetails.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyDetails: View {
    @State private var commentExpanded = false
    @State private var selectedImageIndex = 0
    @State private var showMap = false

    var property: PropertyDetailModel

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()
            ScrollView {
                VStack(spacing: DesignSystem.Spacing.m) {
                    SwipeImageGalley(images: property.multimedia.images)

                    propertyDetailsSection

                    Spacer()
                }
                .padding()
            }
        }
    }

    private var propertyDetailsSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            HStack {
                Text(property.formattedPrice)
                    .amountStyle

                Spacer()

                if let communityCost = property.moreCharacteristics.formattedCommunityCosts {
                    Text("\(communityCost) " + property.priceInfo.currencySuffix)
                        .captionStyle
                }
                Text("COMMUNITY".localized)
                    .captionStyle
            }

            HStack {
                PropertyTypeTag(propertyType: property.propertyType)

                OperationTag(operationType: property.operation)

                Text(property.moreCharacteristics.exterior ? "EXTERIOR".localized : "INTERIOR".localized)
                    .bodyStyle
            }

            HStack {
                Text("\(property.moreCharacteristics.roomNumber) " + "ROOMS".localized)
                    .bodyStyle

                Text("\(property.moreCharacteristics.bathNumber) " + "BATHROOMS".localized)
                    .bodyStyle

                Text("\(property.moreCharacteristics.constructedArea) " + "m2")
                    .bodyStyle
            }
            HStack {
                Text("\(property.moreCharacteristics.floor) " + "PLANTA".localized)
                    .bodyStyle

                if property.moreCharacteristics.isDuplex {
                    Text("DUPLEX".localized)
                        .bodyStyle
                }
            }

            sectionBanner(title: "MORE_INFO".localized)

            moreInfoLabels
                .padding(.leading, DesignSystem.Spacing.m)

            sectionBanner(title: "DESCRIPTION".localized)

            descriptionContent

            sectionBanner(title: "LOCALIZATION".localized)

            MapView(latitude: property.ubication.latitude, longitude: property.ubication.longitude)
                .frame(height: 200)
                .onTapGesture {
                    showMap = true
                }
            
        }
        .navigationDestination(isPresented: $showMap) {
            MapView(latitude: property.ubication.latitude, longitude: property.ubication.longitude)
        }
    }

    private var descriptionContent: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
            Text(property.propertyComment)
                .bodyStyle
                .lineLimit(commentExpanded ? nil : 5)

            Button(action: {
                commentExpanded.toggle()
            }) {
                Text(commentExpanded ? "VER_MENOS".localized : "VER_COMENTARIO_COMPLETO".localized)
                    .actionStyle
            }
        }
    }

    private var moreInfoLabels: some View {
        VStack(alignment: .leading) {
            Text("CERTIFICATION".localized + ":  " +
                property.moreCharacteristics.energyCertificationType.uppercased())
                .bodyStyle

            Text(property.moreCharacteristics.lift ? "LIFT".localized : "NO_LIFT".localized)
                .bodyStyle

            Text(property.moreCharacteristics.boxroom ? "BOXROOM".localized : "NO_BOXROOM".localized)
                .bodyStyle

            Text(property.moreCharacteristics.status.localized)
                .bodyStyle
        }
    }

    private func sectionBanner(title: String) -> some View {
        HStack {
            Text(title)
                .bannerStyle
                .foregroundStyle(DesignSystem.Colors.primaryText)
                .padding(.vertical, DesignSystem.Spacing.s)

            Spacer()
        }
        .padding(.horizontal, DesignSystem.Spacing.m)
        .background(DesignSystem.Colors.accentGray)
        .cornerRadius(DesignSystem.CornerRadius.m)
    }
}

#Preview {
    PropertyDetails(property: .mockPropertyDetailModelSell)
}
