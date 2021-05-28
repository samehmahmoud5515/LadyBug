//
//  User.swift
//  LadyBug
//
//  Created by SAMEH on 23/04/2021.
//

import Foundation

// MARK: - User
struct User: Codable {
    var id: Int?
    var name, email, mobile: String?
    var activityPoints: Int?
    var jobName, photoURL, status: String?
    var isNotifiable: Bool?
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
        case isNotifiable = "is_notifiable"
        case mobileVerified = "mobile_verified"
        case emailVerified = "email_verified"
        case roles, rating
        case isFollowing = "is_following"
        case isRated = "is_rated"
    }
}
