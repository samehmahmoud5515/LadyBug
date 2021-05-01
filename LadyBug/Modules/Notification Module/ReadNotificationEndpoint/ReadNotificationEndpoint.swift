//
//  GetUserNotificationsEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Moya

enum ReadNotificationEndpoint{
    case readNotification
}

extension ReadNotificationEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/users/notifications/index"
    }

   var method: Method {
    .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .readNotification:
            let paramters = ["":""]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        
        return commonHeader
    }

    var authorizationType: AuthorizationType {
        .bearer
    }
}

