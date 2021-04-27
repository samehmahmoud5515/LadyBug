//
//  File2.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Foundation
// MARK: - User
struct UpdateUser: Codable {
    var id: Int?
    var name, email, mobile: String?
    var activityPoints: Int?
    var jobName, photoURL, status: String?
    var mobileVerified, emailVerified: Int?
    var roles: [String]?
    var rating: String?
    var isFollowing, isRated: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, email, mobile
        case activityPoints = "activity_points"
        case jobName = "job_name"
        case photoURL = "photo_url"
        case status
        case mobileVerified = "mobile_verified"
        case emailVerified = "email_verified"
        case roles, rating
        case isFollowing = "is_following"
        case isRated = "is_rated"
    }
}
