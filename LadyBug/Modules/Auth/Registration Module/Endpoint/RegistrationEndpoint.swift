
//  RegistrationEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/17/21.


import Moya

enum RegistrationEndpoint {
    case registration(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String)
}

extension RegistrationEndpoint: TargetType {
    var baseURL: URL {
        Environment.baseUrl
    }

    var path: String {
        "/api/v1/auth/register"
    }

   var method: Method {
        .post
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case let .registration(name , email , mobile , password , passwordConfirmation ,humanJobId , photo  ):
            let paramters = ["name": name, "email": email, "mobile": mobile, "password": password, "password_confirmation": passwordConfirmation, "human_job_id": humanJobId, "photo": photo]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String : String]? {
        ["Accept" : "application/json" , "x-api-key": "20LAdyx%ano@0o!#vXLZBUg65" ]
    }


}
