//
//  Product.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 06/10/2022.
//

import Foundation

struct Product: Codable, Identifiable {
    let name, url: String
    let price: Price
    let primaryImageMap: PrimaryImageMap
    let designer: Designer
    let id = UUID()
  }
