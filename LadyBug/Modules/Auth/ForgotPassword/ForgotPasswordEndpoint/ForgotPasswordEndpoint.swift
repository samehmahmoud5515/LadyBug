//
//  ForgotPasswordEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/19/21.
//

import Moya



enum ForgotPasswordEndpoint {
    case forgotPassword(email: String)
}

extension ForgotPasswordEndpoint: TargetType {
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
        case let .forgotPassword(email):
            let paramters = ["":""]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        ["Accept" : "application/json" , "x-api-key": "20LAdyx%ano@0o!#vXLZBUg65" ]
    }
}

