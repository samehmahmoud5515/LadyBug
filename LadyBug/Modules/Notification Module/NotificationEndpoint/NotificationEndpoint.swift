//
//  NotificationEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Moya

enum NotificationEndpoint {
    case getUserNotifications
    case unreadNotification(notificationId : String )
    case readNotification(notificationId : String )
    
}

extension NotificationEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .getUserNotifications:
            return  "/api/v1/users/notifications/index"
        case .unreadNotification(notificationId: let notificationId):
            return "/api/v1/users/notifications/read/" + notificationId
        case .readNotification(notificationId: let notificationId):
            return "/api/v1/users/notifications/read/" + notificationId
            
        }
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case  .unreadNotification:
            return .requestPlain
        case .getUserNotifications:
            return .requestPlain
        case .readNotification :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        .bearer
    }
}
