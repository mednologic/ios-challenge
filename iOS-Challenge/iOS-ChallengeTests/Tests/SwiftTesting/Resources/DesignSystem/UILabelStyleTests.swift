//
//  UILabelStyleTests.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import Testing
@testable import iOS_Challenge
import UIKit

@MainActor
struct UILabelStyleTests {

    @Test("Should apply title style correctly")
    func test_titleStyle() {
        let label = UILabel()
        label.applyTitleStyle()

        #expect(label.font.pointSize == DSSizesText.title.rawValue)
        #expect(label.font.weight == .bold)
        #expect(label.textColor == DesignSystem.Colors.primaryTextUIColor)
    }

    @Test("Should apply subtitle style correctly")
    func test_subtitleStyle() {
        let label = UILabel()
        label.applySubtitleStyle()

        #expect(label.font.pointSize == DSSizesText.subtitle.rawValue)
        #expect(label.font.weight == .semibold)
        #expect(label.textColor == DesignSystem.Colors.secondaryTextUIColor)
    }

    @Test("Should apply body style correctly")
    func test_bodyStyle() {
        let label = UILabel()
        label.applyBodyStyle()

        #expect(label.font.pointSize == DSSizesText.body.rawValue)
        #expect(label.font.weight == .regular)
        #expect(label.textColor == DesignSystem.Colors.primaryTextUIColor)
    }

    @Test("Should apply caption style correctly")
    func test_captionStyle() {
        let label = UILabel()
        label.applyCaptionStyle()

        #expect(label.font.pointSize == DSSizesText.caption.rawValue)
        #expect(label.font.weight == .regular)
        #expect(label.textColor == DesignSystem.Colors.secondaryTextUIColor)
    }
}
