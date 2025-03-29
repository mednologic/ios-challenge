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
            }
            PropertyTypeTag(propertyType: property.propertyType)

            if let communityCost = property.moreCharacteristics.communityCosts {
                Text(String(communityCost))
            }
            Text(String(property.moreCharacteristics.roomNumber))
            Text(String(property.moreCharacteristics.bathNumber))
            Text(property.moreCharacteristics.exterior ? "EXTERIOR".localized : "INTERIOR".localized)
            Text(property.moreCharacteristics.energyCertificationType)
            Text(property.moreCharacteristics.flatLocation)
            Text(String(property.moreCharacteristics.constructedArea))
            Text(property.moreCharacteristics.lift ? "LIFT".localized : "NO_LIFT".localized)
            Text(property.moreCharacteristics.boxroom ? "BOXROOM".localized : "NO_BOXROOM".localized)
            if property.moreCharacteristics.isDuplex {
                Text("BOXROOM".localized)
            }
            Text(String(property.moreCharacteristics.floor))
            Text(property.moreCharacteristics.status) // TODO: traduïr

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
}

#Preview {
    PropertyDetails(property: .mockPropertyDetailModelSell)
}
