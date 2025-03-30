//
//  EndPointsContainer.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import Foundation

let api = URL(string: "https://idealista.github.io/ios-challenge/")!

extension URL {
    static let getList = api.appending(path: "list.json")
    static let getDetails = api.appending(path: "detail.json")
}
