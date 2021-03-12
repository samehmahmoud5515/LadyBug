//
//  Coordinate.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import Foundation

class Coordinate {
    let longitude: Double
    let latitude: Double

    var address: String?

    init(longitude: Double, latitude: Double, address: String? = nil) {
        self.longitude = longitude
        self.latitude = latitude
        self.address = address
    }
}
