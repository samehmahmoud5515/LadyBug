//
//  ProfileModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/12/21.
//

import Foundation
struct ProfileResponed: Codable {
    let success: Bool?
    let data: JObsUserInfo?
    let message: String?
    let code: Int?
}

struct JObsUserInfo: Codable {
    var id: Int?
    var name, email, mobile: String?
    var activityPoints, humanJobID, emailVerified, mobileVerified: Int?
    var status: String?
    var emailVerifiedAt: String?
    var createdAt, updatedAt: String?
    var deletedAt: String?
    var isNotifiable: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, email, mobile
        case activityPoints = "activity_points"
        case humanJobID = "human_job_id"
        case emailVerified = "email_verified"
        case mobileVerified = "mobile_verified"
        case status
        case emailVerifiedAt = "email_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case isNotifiable = "is_notifiable"
    }
}


