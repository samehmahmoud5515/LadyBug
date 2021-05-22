//
//  GetNotificationResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/1/21.
//

import Foundation

// MARK: - NotificationResponse
struct NotificationResponse: Codable {
    var success: Bool?
    var data: NotificationResponseData?
    var message: String?
    var code: Int?
}

// MARK: - NotificationResponseData
struct NotificationResponseData: Codable {
    var count: Int?
    var all: [Notification]?
}

// MARK: - All
struct Notification: Codable {
    var id: String?
    var notifiableID: Int?
    var type, readAt: String?
    var isRead: Bool?
    var createdAt, title, body: String?
    var data: NotificationData?

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

// MARK: - AllData
struct NotificationData: Codable {
    var inviter, role, farm: Int?
    var url: String?
    var expires, signature: String?
}
