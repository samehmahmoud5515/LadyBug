//
//  LoginResponse.swift
//  LadyBug
//
//  Created by SAMEH on 23/04/2021.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    var success: Bool?
    var data: LoginResult?
    var message: String?
    var code: Int?
}

// MARK: - DataClass
struct LoginResult: Codable {
    var user: User?
    var accessToken, tokenType: String?
    var expiresInMinutes: Int?

    enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresInMinutes = "expires_in_minutes"
    }
}
