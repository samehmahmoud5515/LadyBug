//
//  File.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Foundation

struct UpdateResponse : Codable {
    let success: Bool?
    let data: UpdateResult?
    let message: String?
    let code: Int?
}
// MARK: - DataClass
struct UpdateResult: Codable {
    let user: UpdateUser?
    let accessToken, tokenType: String?
    let expiresInMinutes: Int?

    enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresInMinutes = "expires_in_minutes"
    }
}
