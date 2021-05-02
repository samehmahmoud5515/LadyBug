//
//  GetNotificationResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/1/21.
//

import Foundation
// MARK: - Register
struct NotificationResponse: Codable {
    let success: Bool?
    let data: NotificationData?
    let message: String?
    let code: Int?
}

// MARK: - RegisterData
struct NotificationData: Codable {
    let count: Int?
    let notificationResult: [NotificationResult]?
}

// MARK: - All
struct NotificationResult: Codable {
    let id: String?
    let notifiableID: Int?
    let type, readAt: String?
    let isRead: Bool?
    let createdAt, title, body: String?
    let data: UserInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case notifiableID = "notifiable_id"
        case type
        case readAt = "read_at"
        case isRead = "is_read"
        case createdAt = "created_at"
        case title, body, data
    }
}

// MARK: - Data
struct UserInfo: Codable {
    let inviter, role, farm: Int?
    let url: String?
    let expires, signature: String?
}

