//
//  TextExtension.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

enum DSSizesText: CGFloat {
    case title = 28
    case subtitle = 20
    case banner = 18
    case body = 16
    case caption = 14
}

extension Text {
    var titleStyle: Text {
        font(.system(size: DSSizesText.title.rawValue, weight: .bold))
            .foregroundColor(DesignSystem.Colors.primaryText)
    }

    var subtitleStyle: Text {
        font(.system(size: DSSizesText.subtitle.rawValue, weight: .semibold))
            .foregroundColor(DesignSystem.Colors.secondaryText)
    }

    var bannerStyle: Text {
        font(.system(size: DSSizesText.banner.rawValue, weight: .semibold))
            .foregroundColor(DesignSystem.Colors.secondaryText)
    }

    var bodyStyle: Text {
        font(.system(size: DSSizesText.body.rawValue, weight: .regular))
            .foregroundColor(DesignSystem.Colors.primaryText)
    }

    var captionStyle: Text {
        font(.system(size: DSSizesText.caption.rawValue, weight: .regular))
            .foregroundColor(DesignSystem.Colors.secondaryText)
    }

    var amountStyle: Text {
        font(.system(size: DSSizesText.subtitle.rawValue, weight: .regular))
            .foregroundColor(DesignSystem.Colors.secondaryText)
            .bold()
    }

    var actionStyle: Text {
        font(.system(size: DSSizesText.caption.rawValue, weight: .regular))
            .foregroundColor(DesignSystem.Colors.actionDS)
    }
}
