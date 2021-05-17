//
//  FarmEndPoint.swift
//  LadyBug
//
//  Created by SAMEH on 13/05/2021.
//

import Moya

enum FarmEndPoint {
    case farmDetails(id: String)
    case userFarms
}

extension FarmEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        switch self {
        case .farmDetails(let id):
            return "/api/v1/farms/" + id
        case .userFarms:
            return "/api/v1/users/farms/index"
        }
    }
    
    var method: Method {
        switch self {
        case .farmDetails:
            return .get
        case .userFarms:
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .farmDetails:
            return .requestPlain
        case .userFarms:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        return .bearer
    }
}

