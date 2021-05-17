//
//  FarmDetailsResponse.swift
//  LadyBug
//
//  Created by SAMEH on 13/05/2021.
//

import Foundation

// MARK: - FarmDetailsResponse
struct FarmDetailsResponse: Codable {
    var success: Bool?
    var data: Farm?
    var message: String?
    var code: Int?
}
