//
//  TasksEndPoint.swift
//  LadyBug
//
//  Created by SAMEH on 28/05/2021.
//

import Moya

enum TasksEndPoint {
    case todaysTask(long: Double, lat: Double)
    case toggleFinish(id: String)
}

extension TasksEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        switch self {
        case .todaysTask:
            return "/api/v1/users/today_tasks/index"
        case .toggleFinish(let id):
            return "/api/v1/service_tasks/toggle_finish/" + id
        }
    }
    
    var method: Method {
        switch self {
        case .todaysTask:
            return .post
        case .toggleFinish:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case let .todaysTask(long, lat):
            var paramters = [String: Any]()
            paramters.updateValue(lat, forKey: "lat")
            paramters.updateValue(long, forKey: "lon")
            paramters.updateValue(Language.ar.rawValue, forKey: "lang")
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        case .toggleFinish:
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
