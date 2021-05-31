//
//  GetProfileEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/12/21.
//

import Moya

enum ProfileEndPoint {
    case getProfile
    case updateUser(userId: String)
}

extension ProfileEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        switch self {
        case .getProfile:
            return "/api/v1/auth/me"
        case .updateUser(let userId):
            return "/api/v1/users" + userId
        }
    }

    var method: Method {
        switch self {
        case .getProfile:
            return .get
        case .updateUser:
            return .post
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .getProfile:
             return .requestPlain
        case .updateUser:
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
