//
//  ReverseGeocodeService.swift
//  PublicTowingApp
//
//  Created by sameh on 9/8/20.
//  Copyright © 2020 Sameh. All rights reserved.
//

import GoogleMaps

class ReverseGeocodeService {

    func reverseGeocodeToAddress(lat: Double, long: Double, completion: @escaping (String) -> Void) {
        GMSGeocoder().reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: long)) { response, _ in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            completion(lines.joined(separator: "\n").replacingOccurrences(of: "Unnamed Road,", with: "").replacingOccurrences(of: "Unnamed Road - ", with: ""))
        }
    }
}
