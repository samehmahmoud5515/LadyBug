//
//  ProfileModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/12/21.
//

import Foundation

struct ProfileResponse: Codable {
    var success: Bool?
    var data: User?
    var message: String?
    var code: Int?
}

