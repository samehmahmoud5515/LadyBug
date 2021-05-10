//
//  FollowersModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/2/21.
//


import Foundation

// MARK: - FollowingsResponed
struct FollowingsResponed: Codable {
    let success: Bool?
    let data: FollowingsResult?
    let message: String?
    let code: Int?
}

// MARK: - FollowingsResult
struct FollowingsResult: Codable {
    var count: Int = 0
    var Followers: [User] = []
    enum CodingKeys: String, CodingKey {
        case count
        case Followers = "all"
    }
}




