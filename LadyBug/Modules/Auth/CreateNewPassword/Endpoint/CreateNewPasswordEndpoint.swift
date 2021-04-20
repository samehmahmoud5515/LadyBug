//
//  CreateNewPasswordEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/19/21.
//

import Moya

enum CreateNewPasswordEndpoint {
    case createNewPassword( password: String, passwordConfirmation: String)
}

extension CreateNewPasswordEndpoint: TargetType {
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
        case let .createNewPassword( password , passwordConfirmation ):
            let paramters = ["password": password, "password_confirmation": passwordConfirmation]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        ["Authorization":"","Accept" : "application/json" , "x-api-key": "20LAdyx%ano@0o!#vXLZBUg65" ]
    }


}
