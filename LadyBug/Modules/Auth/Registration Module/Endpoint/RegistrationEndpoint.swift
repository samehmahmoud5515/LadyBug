
//  RegistrationEndpoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/17/21.


import Moya

enum RegistrationEndpoint {
    case setNewUser(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: MediaUpload?)
}

extension RegistrationEndpoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
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
        case let .setNewUser(name , email , mobile , password , passwordConfirmation ,humanJobId , photo  ):
//            let paramters = ["name": name, "email": email, "mobile": mobile, "password": password, "password_confirmation": passwordConfirmation, "human_job_id": humanJobId, "photo": photo]
//            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
            
            
            var formData: [Moya.MultipartFormData] = []
                if let userPhoto = photo?.image.jpegData(compressionQuality: 0) {
                    formData.append(Moya.MultipartFormData(provider: .data(userPhoto), name: "photo", fileName: photo?.fileName ?? "", mimeType: "image/jpeg"))
                }
                
                let name = name.data(using: .utf8) ?? Data()
                let email = email.data(using: .utf8) ?? Data()
                let mobile = mobile.data(using: .utf8) ?? Data()
                let password = password.data(using: .utf8) ?? Data()
                let passwordConfirmation = passwordConfirmation.data(using: .utf8) ?? Data()
                let humanJobId = "\(humanJobId)".data(using: .utf8) ?? Data()
                
                formData.append(Moya.MultipartFormData(provider: .data(name), name: "name"))
                formData.append(Moya.MultipartFormData(provider: .data(email), name: "email"))
                formData.append(Moya.MultipartFormData(provider: .data(mobile), name: "mobile"))
                formData.append(Moya.MultipartFormData(provider: .data(password), name: "password"))
                formData.append(Moya.MultipartFormData(provider: .data(passwordConfirmation), name: "password_confirmation"))
                formData.append(Moya.MultipartFormData(provider: .data(humanJobId), name: "human_job_id"))
               
                
                return .uploadMultipart(formData)
            }
        }

    var headers: [String : String]? {
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        return .none
       }
    
}
