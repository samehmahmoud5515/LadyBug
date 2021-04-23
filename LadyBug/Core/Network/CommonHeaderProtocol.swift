//
//  CommonHeaderProtocol.swift
//  LadyBug
//
//  Created by SAMEH on 23/04/2021.
//

import Foundation

protocol CommonHeaderProtocol {
    var commonHeader: [String: String] { get }
}

extension CommonHeaderProtocol {
    var commonHeader: [String: String] {
        return ["Accept": "application/json" , "x-api-key": Environment.apiKey]
    }
}
