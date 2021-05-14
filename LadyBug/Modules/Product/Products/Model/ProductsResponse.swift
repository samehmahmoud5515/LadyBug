//
//  ProductsResponse.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/13/21.
//

import Foundation
import Foundation

// MARK: - ProductsResponse
struct ProductsResponse: Codable {
    var success: Bool?
    var data: ProductsData?
    var message: String?
    var code: Int?
}

// MARK: - ProductsData
struct ProductsData: Codable {
    var all: [Products]?
}

// MARK: - Products
struct Products: Codable {
    var id: Int?
    var name: String?
    var price: Double?
    var description: String?
    var descriptionArLocalized: String?
    var descriptionEnLocalized: String?
    var nameArlocalized: String?
    var nameEnLocalized: String?
    var cityID: Int?
    var districtID: Int?
    var farmedTypeId: Int?
    var sellerID: Int?
    var farmedType: String?
    var city: String?
    var district: String?
    var sellerMobile: String?
    var sold: Bool?
    var otherLinks: String?
    var internalAssets, externalAssets: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, price,description
        case descriptionArLocalized = "description_ar_localized"
        case descriptionEnLocalized = "description_en_localized"
        case nameArlocalized = "name_ar_localized"
        case nameEnLocalized = "name_en_localized"
        case cityID = "city_id"
        case districtID = "district_id"
        case farmedTypeId = "farmed_type_id"
        case sellerID = "seller_id"
        case farmedType = "farmed_type"
        case city, district
        case sellerMobile = "seller_mobile"
        case sold
        case otherLinks = "other_links"
        case internalAssets = "internal_assets"
        case externalAssets = "external_assets"
        
    }
}
