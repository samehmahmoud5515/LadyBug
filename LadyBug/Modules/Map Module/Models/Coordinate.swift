//
//  Coordinate.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import GoogleMaps

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

extension Coordinate {
    var toCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
