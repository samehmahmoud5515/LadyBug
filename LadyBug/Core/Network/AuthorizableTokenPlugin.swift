//
//  AuthorizableProtocol.swift
//  LadyBug
//
//  Created by SAMEH on 23/04/2021.
//

import Moya

public struct AuthorizableTokenPlugin: PluginType {

    public let token: String

    init(token: String = AccessTokenManager.accessToken ?? "") {
        self.token = token
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {

        guard let authorizable = target as? AccessTokenAuthorizable else { return request }

        let authorizationType = authorizable.authorizationType
        var request = request

        switch authorizationType {
        case .basic, .bearer, .custom:
            if let value = authorizationType.value {
                let authValue = value + " " + token
                request.addValue(authValue, forHTTPHeaderField: "Authorization")
            }
        case .none:
            break
        }

        return request
    }
}
