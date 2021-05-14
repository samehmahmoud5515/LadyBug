//
//  PasswordEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/9/21.
//

import Moya

enum PasswordEndpoint {
    case createNewPassword( password: String)
    case forgetPassword(email: String)
}

extension PasswordEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
            
        case .createNewPassword:
            return  "/public/api/v1/users/12"
        case .forgetPassword:
            return  "/api/v1/auth/me"
            
        }
    }
    
    var method: Method {
        
        switch self {
        case .createNewPassword:
            return .get
        case .forgetPassword:
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case let .createNewPassword( password ):
            let paramters = ["password": password]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        case let .forgetPassword(email):
            let paramters = ["":""]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        return .bearer
    }
    
}
