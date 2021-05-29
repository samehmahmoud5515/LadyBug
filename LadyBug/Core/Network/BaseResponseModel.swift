//
//  BaseResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/28/21.
//

import Foundation
struct BaseResponse: Codable {
    var success: Bool?
    var message: String?
    var code: Int?
}
