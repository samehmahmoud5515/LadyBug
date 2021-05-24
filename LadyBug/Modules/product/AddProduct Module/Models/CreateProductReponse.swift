//
//  CreateProductReponse.swift
//  LadyBug
//
//  Created by SAMEH on 23/05/2021.
//

import Foundation

struct CreateProductReponse: Codable {
    var success: Bool?
    var data: Product?
    var message: String?
    var code: Int?
}
