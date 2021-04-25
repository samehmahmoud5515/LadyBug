//
//  LoginEndPoint.swift
//  LadyBug
//
//  Created by SAMEH on 16/04/2021.
//

import Moya

enum LoginEndPoint {
    case login(username: String, password: String)
}

extension LoginEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        "/api/v1/auth/login"
    }
    
    var method: Method {
        .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case let .login(username, password):
            let paramters = ["identify": username, "password": password]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Accept" : "application/json" , "x-api-key": "20LAdyx%ano@0o!#vXLZBUg65" ]
    }
    
    var authorizationType: AuthorizationType {
        return .bearer
    }    
}
