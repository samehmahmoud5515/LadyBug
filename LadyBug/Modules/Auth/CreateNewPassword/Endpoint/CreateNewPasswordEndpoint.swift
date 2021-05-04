//
//  CreateNewPasswordEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/19/21.
//

import Moya

enum CreateNewPasswordEndpoint {
    case createNewPassword( password: String)
}

extension CreateNewPasswordEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/public/api/v1/users/12"
    }

   var method: Method {
        .post
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .createNewPassword( password ):
            let paramters = ["password": password]
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
