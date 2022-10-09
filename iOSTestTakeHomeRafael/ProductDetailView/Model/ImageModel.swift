//
//  ImageModel.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 08/10/2022.
//

import Foundation



struct PrimaryImageMap: Codable {
    let large: PrimaryImageMapLarge
}

struct PrimaryImageMapLarge: Codable {
    let url: String
}
