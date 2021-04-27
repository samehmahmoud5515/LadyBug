//
//  RegistrationResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/26/21.
//

import Foundation

struct RegisterResponse : Codable {
    let success: Bool?
    let data: RegisterResult?
    let message: String?
    let code: Int?
}

// MARK: - DataClass
struct RegisterResult: Codable {
    let user: RegistrationUser?
    let accessToken, tokenType: String?
    let expiresInMinutes: Int?

    enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresInMinutes = "expires_in_minutes"
    }
}
