//
//  NotificationEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Moya

enum NotificationEndpoint {
    case getUserNotifications
    case unreadNotification
    case readNotification
    
}

extension NotificationEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .unreadNotification:
            return "/api/v1/users/notifications/read/d4fc0ede-f6bc-4123-aa6a-13fb5c135bcd"
        case .getUserNotifications:
            return  "/api/v1/users/notifications/index"
        case .readNotification:
            return  "/api/v1/users/notifications/index"
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
