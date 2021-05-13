//
//  FollowersEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/2/21.
//

import Moya
enum FollowersEndPoint {
    case getUserFollowers
    case getUserFollowings
    case toggleFollow(userId : Int )
    
}

extension FollowersEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .getUserFollowers:
            return "/api/v1/users/followers/index"
        case .getUserFollowings:
            return "/api/v1/users/followings/index"
        case .toggleFollow(let userId) :
            return "/api/v1/users/toggle_follow/" + String(userId)
        }

    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getUserFollowers:
            return .requestPlain
        case .getUserFollowings:
            return .requestPlain
        case .toggleFollow :
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
