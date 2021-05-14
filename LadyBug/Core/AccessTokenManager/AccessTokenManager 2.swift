//
//  AccessTokenManager.swift
//  LadyBug
//
//  Created by SAMEH on 23/04/2021.
//

import Foundation

class AccessTokenManager {
    static var accessToken = Defaults[.accessToken]
    
    static var isAccessTokenEmpty: Bool {
        return Defaults[.accessToken]?.isEmpty ?? true
    }
    
    class func saveAccessToken(token: String) {
        Defaults[.accessToken] = token
    }
    
    class func removeAccessToken() {
        Defaults[.accessToken] = nil
    }
}
