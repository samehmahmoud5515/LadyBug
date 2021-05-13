//
//  GetNotificationResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/1/21.
//

//import Foundation
//// MARK: -
//struct NotificationResponse: Codable {
//    let success: Bool?
//    let data: NotificationData?
//    let message: String?
//    let code: Int?
//}
//
//// MARK: -
//struct NotificationData: Codable {
//    var count: Int = 0
//    var notifications: [Notification] = []
//    enum CodingKeys: String, CodingKey {
//           case count
//           case notifications = "notificationResult"
//       }
//}
//
//// MARK: -
//struct Notification: Codable {
//    let id: String?
//    let notifiableID: Int?
//    let type, readAt: String?
//    let isRead: Bool?
//    let createdAt, title, body: String?
//    let data: UserInfo?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case notifiableID = "notifiable_id"
//        case type
//        case readAt = "read_at"
//        case isRead = "is_read"
//        case createdAt = "created_at"
//        case title, body, data
//    }
//}
//
//// MARK: - Data
//struct UserInfo: Codable {
//    let inviter, role, farm: Int?
//    let url: String?
//    let expires, signature: String?
//}

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
