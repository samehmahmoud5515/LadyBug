//
//  UpdateUserEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/27/21.
//

import Moya

enum UpdateUserEndPoint {
    case updateUser(name: String, email: String,humanJobId: String, photo: String)
}

extension UpdateUserEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/users/12"
    }

   var method: Method {
        .post
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .updateUser(name , email ,humanJobId , photo ):
            let paramters = ["name": name, "email": email, "human_job_id": humanJobId, "photo": photo]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        
        return commonHeader
    }

    var authorizationType: AuthorizationType {
        .bearer
    }
}
