//
//  PropertyModelExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

extension PropertyModel {
    var formattedSize: String {
        String(format: "%.0f m²", size)
    }

    var formattedRooms: String {
        "\(rooms) \("ROOMS".localized)"
    }
}
