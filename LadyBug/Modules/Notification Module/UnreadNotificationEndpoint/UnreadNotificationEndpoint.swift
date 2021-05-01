//
//  UnreadNotificationEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Moya

enum UnreadNotificationEndpoint {
    case unreadNotification
}

extension UnreadNotificationEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/users/notifications/read/d4fc0ede-f6bc-4123-aa6a-13fb5c135bcd"
    }

   var method: Method {
    .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .unreadNotification:
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
