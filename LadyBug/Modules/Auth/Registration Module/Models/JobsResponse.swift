//
//  JobsResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/1/21.
//

import Foundation

// MARK: - JobsResponse
struct JobsResponse: Codable {
    let success: Bool?
    let data: JobsResult?
    let message: String?
    let code: Int?
}

// MARK: - JobsResult
struct JobsResult: Codable {
    let all: [JobsInfo]?
}

// MARK: - JobsInfo
struct JobsInfo: Codable {
    let id: Int?
    let name: String?
}

