//
//  PriceModel.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 06/10/2022.
//

import Foundation

struct Price: Codable {
    let value: Double
}
struct Currencies: Codable {
    let base: String
    let rates: Rates
}
// MARK: - Rates
struct Rates: Codable {
    let eur: Double
    let gbp: Double
    let usd: Double

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case gbp = "GBP"
        case usd = "USD"
    }
}

