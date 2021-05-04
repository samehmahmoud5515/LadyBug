//
//  ForgetPasswordEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/19/21.
//

import Moya

enum ForgetPasswordEndPoint {
    case forgetPassword(email: String)
}

extension ForgetPasswordEndPoint: TargetType , AccessTokenAuthorizable, CommonHeaderProtocol{
   
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/auth/me"
    }

   var method: Method {
    .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .forgetPassword(email):
            let paramters = ["":""]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        return commonHeader
    }
    var authorizationType: AuthorizationType {
        .none
       }
}

