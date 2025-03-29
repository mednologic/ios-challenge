//
//  PropertyDetails.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

struct PropertyDetails: View {
    @State private var commentExpanded = false
    var property: PropertyDetailModel

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()
            ScrollView {
                VStack(spacing: DesignSystem.Spacing.m) {
                    ImageView(urlString: property.multimedia.first?.url)
                        .overlay(alignment: .bottomTrailing) {
                            if !property.multimedia.isEmpty {
                                FotoCountTag(count: property.multimedia.count)
                                    .padding([.trailing, .bottom], DesignSystem.Spacing.s)
                            }


                        }
                        .overlay(alignment: .topLeading){
                            OperationTag(operationType: property.operation)
                                .padding([.leading, .top], DesignSystem.Spacing.s)
                        }
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
                    Text(String(communityCost))
                        .captionStyle

                }
                Text("COMMUNITY".localized)
                    .captionStyle

            }

            HStack {
                PropertyTypeTag(propertyType: property.propertyType)
                Text(property.moreCharacteristics.exterior ? "EXTERIOR".localized : "INTERIOR".localized)
            }

            HStack {
                Text("\(property.moreCharacteristics.roomNumber) " + "ROOMS".localized)

                Text("\(property.moreCharacteristics.bathNumber) " + "BATHROOMS".localized)

                Text("\(property.moreCharacteristics.constructedArea) " + "m2")
            }
            HStack {
                Text("\(property.moreCharacteristics.floor) " + "PLANTA".localized)

                if property.moreCharacteristics.isDuplex {
                    Text("DUPLEX".localized)
                }
            }

            sectionBanner(title: "MORE_INFO".localized)

            Text("CERTIFICATION".localized + ":  " +
                 property.moreCharacteristics.energyCertificationType.uppercased())

            Text(property.moreCharacteristics.lift ? "LIFT".localized : "NO_LIFT".localized)

            Text(property.moreCharacteristics.boxroom ? "BOXROOM".localized : "NO_BOXROOM".localized)

            Text(property.moreCharacteristics.status) // TODO: traduïr

            sectionBanner(title: "DESCRIPTION".localized)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(property.propertyComment)
                    .lineLimit(commentExpanded ? nil : 5)

                Button(action: {
                    commentExpanded.toggle()
                }) {
                    Text(commentExpanded ? "VER_MENOS".localized : "VER_COMENTARIO_COMPLETO".localized)
                        .actionStyle
                }
            }
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
