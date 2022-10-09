//
//  Product.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 06/10/2022.
//

import Foundation

struct Product: Codable {
    let name, url: String
    let price: Price
    let images: String
    let designer: Designer
  }
