//
//  MoreMenuEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/20/21.
//

import Moya

enum MoreMenuEndpoint {
    case moreMenu(token : String )
}

extension MoreMenuEndpoint: TargetType {
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
        case let .moreMenu(_):
            let paramters = ["":""]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        ["Authorization": "bearer" + "","Accept": "application/json" , "x-api-key": "20LAdyx%ano@0o!#vXLZBUg65" ]
    }


}

