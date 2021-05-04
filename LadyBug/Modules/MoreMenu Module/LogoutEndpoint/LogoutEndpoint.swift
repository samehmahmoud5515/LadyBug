//
//  LogoutEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/20/21.
//

import Moya

enum LogoutEndpoint {
    case logout
}

extension LogoutEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/auth/logout"
    }

    var method: Method {
        .post
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .logout :
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




