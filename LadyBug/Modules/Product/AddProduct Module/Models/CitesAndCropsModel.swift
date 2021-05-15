//
//  CitesAndCropsModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/14/21.
//
import Foundation
// MARK: - ProductsRelationsResponse
struct ProductsRelationsResponse: Codable {
    var success: Bool?
    var data: citesAndFarmedTypes?
    var message: String?
    var code: Int?
}

// MARK: - citesAndCrops
struct citesAndFarmedTypes: Codable {
    var cities: [City]?
    var farmedTypes: [FarmedType]?
    
    enum CodingKeys: String, CodingKey {
        case cities
        case farmedTypes = "farmed_types"
    }
}

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var districts: [District]?
}

// MARK: - District
struct District: Codable {
    var id, cityID: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case cityID = "city_id"
        case name
    }
}

// MARK: - FarmedType
struct FarmedType: Codable {
    var id: Int?
    var name, farmActivityTypeName: String?
    var farmActivityTypeID: Int?
    var photoURL: String?
    var selected: Int?
    var farmedTypeClasses: [FarmedTypeClass]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case farmActivityTypeName = "farm_activity_type_name"
        case farmActivityTypeID = "farm_activity_type_id"
        case photoURL = "photo_url"
        case selected
        case farmedTypeClasses = "farmed_type_classes"
    }
}

// MARK: - FarmedTypeClass
struct FarmedTypeClass: Codable {
    var id: Int?
    var name: String?
    var farmedTypeID: Int?
    var farmedTypeName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case farmedTypeID = "farmed_type_id"
        case farmedTypeName = "farmed_type_name"
    }
}

