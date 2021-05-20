//
//  GetProfileEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/12/21.
//

import Moya

enum GetProfileEndPoint {
    case getProfile
}

extension GetProfileEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
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
        case .getProfile :
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
