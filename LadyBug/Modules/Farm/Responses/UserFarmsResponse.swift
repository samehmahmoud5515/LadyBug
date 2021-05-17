//
//  UserFarmsResponse.swift
//  LadyBug
//
//  Created by SAMEH on 13/05/2021.
//

import Foundation

// MARK: - UserFarmsResponse
struct UserFarmsResponse: Codable {
    var success: Bool?
    var data: WeatherFarmResponse?
    var message: String?
    var code: Int?
}

// MARK: - DataClass
struct WeatherFarmResponse: Codable {
    var weatherData: WeatherData?
    var farms: [Farm]?

    enum CodingKeys: String, CodingKey {
        case weatherData = "weather_data"
        case farms
    }
}

// MARK: - Farm
struct Farm: Codable {
    var id, adminID: Int?
    var code: String?
    var real, archived: Bool?
    var farmActivityType: FarmActivityType?
    var farmedType: FarmedType?
    var farmedTypeClass: FarmedTypeClass?
    var location: Location?
    var farmingDate: String?
    var farmingCompatibility: Int?
    var farmingMethod: FarmActivityType?
    var farmingWay: FarmingWay?
    var irrigationWay, soilType: FarmActivityType?
    var soilDetail, irrigationWaterDetail: Detail?
    var area: Int?
    var areaUnit: Unit?
    var farmedNumber: Int?
    var homePlantPotSize: HomePlantPotSize?
    var homePlantIlluminatingSource, animalBreedingPurpose: FarmActivityType?
    var animalDrinkWaterSaltDetail: SaltDetail?
    var animalMedicineSources, animalFodderSources, animalFodderTypes, chemicalFertilizerSources: [FarmActivityType]?
    var seedlingSources: [FarmActivityType]?
    var users: [User]?
    var posts: [Post]?
    var serviceTables: [ServiceTable]?
    var comingTask: FarmTask?

    enum CodingKeys: String, CodingKey {
        case id
        case adminID = "admin_id"
        case code, real, archived
        case farmActivityType = "farm_activity_type"
        case farmedType = "farmed_type"
        case farmedTypeClass = "farmed_type_class"
        case location
        case farmingDate = "farming_date"
        case farmingCompatibility = "farming_compatibility"
        case farmingMethod = "farming_method"
        case farmingWay = "farming_way"
        case irrigationWay = "irrigation_way"
        case soilType = "soil_type"
        case soilDetail = "soil_detail"
        case irrigationWaterDetail = "irrigation_water_detail"
        case area
        case areaUnit = "area_unit"
        case farmedNumber = "farmed_number"
        case homePlantPotSize = "home_plant_pot_size"
        case homePlantIlluminatingSource = "home_plant_illuminating_source"
        case animalBreedingPurpose = "animal_breeding_purpose"
        case animalDrinkWaterSaltDetail = "animal_drink_water_salt_detail"
        case animalMedicineSources = "animal_medicine_sources"
        case animalFodderSources = "animal_fodder_sources"
        case animalFodderTypes = "animal_fodder_types"
        case chemicalFertilizerSources = "chemical_fertilizer_sources"
        case seedlingSources = "seedling_sources"
        case users, posts
        case serviceTables = "service_tables"
        case comingTask = "coming_task"
    }
}

extension Farm {
    var detailsInfo: [FarmUIModel] {
        var info: [FarmUIModel] = []
        let localizer = MyFarmLocalizer()
        if let area = area, let areaUnit = areaUnit?.name {
            info.append(FarmUIModel(title: "\(localizer.numberTitle) \(areaUnit)", value: String(area)))
        }
        
        if let chemicalFertilizerSources = chemicalFertilizerSources {
            let fertilizers = chemicalFertilizerSources.compactMap { $0.name }.joined(separator: ", ")
            info.append(FarmUIModel(title: localizer.chemicalSourceTitle, value: fertilizers))
        }
        
        if let farmingDate = farmingDate {
            info.append(FarmUIModel(title: localizer.farmingDate, value: farmingDate))
        }
        
        if let seedlingSources = seedlingSources {
            let seedling = seedlingSources.compactMap { $0.name }.joined(separator: ", ")
            info.append(FarmUIModel(title: localizer.seedingSource, value: seedling))
        }
        
        if let code = code {
            info.append(FarmUIModel(title: localizer.widgetCodeTitle, value: code))
        }
        
        if let location = location {
            let address = location.details ?? ""
            info.append(FarmUIModel(title: localizer.farmLocationTitle, value: address))
        }
        
        return info
    }
}

// MARK: - FarmActivityType
struct FarmActivityType: Codable {
    var id: Int?
    var name: String?
}

// MARK: - SaltDetail
struct SaltDetail: Codable {
    var id: Int?
    var saltableType: String?
    var ph, co3, hco3, cl: Int?
    var so4, ca, mg, k: Int?
    var na, na2CO3: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case saltableType = "saltable_type"
        case ph = "PH"
        case co3 = "CO3"
        case hco3 = "HCO3"
        case cl = "Cl"
        case so4 = "SO4"
        case ca = "Ca"
        case mg = "Mg"
        case k = "K"
        case na = "Na"
        case na2CO3 = "Na2CO3"
    }
}

// MARK: - Unit
struct Unit: Codable {
    var id: Int?
    var name, code: String?
    var measurable: Measurable?
}

enum Measurable: String, Codable {
    case acidity = "acidity"
    case area = "area"
    case distance = "distance"
}

// MARK: - Task
struct FarmTask: Codable {
    var id: Int?
    var name, startAt, notifyAt: String?
    var farmID, serviceTableID, taskTypeID, quantity: Int?
    var quantityUnitID: Int?
    var dueAt: String?
    var done: Bool?
    var createdAt, updatedAt: String?
    var deletedAt: String?
    var taskTypeName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case startAt = "start_at"
        case notifyAt = "notify_at"
        case farmID = "farm_id"
        case serviceTableID = "service_table_id"
        case taskTypeID = "task_type_id"
        case quantity
        case quantityUnitID = "quantity_unit_id"
        case dueAt = "due_at"
        case done
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case taskTypeName = "task_type_name"
    }
}

extension FarmTask {
    var startDate: Date? {
        return startAt?.toDate
    }
}

// MARK: - FarmedType
struct FarmedType: Codable {
    var id: Int?
    var name: String?
    var farmActivityTypeName: String?
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

// MARK: - FarmingWay
struct FarmingWay: Codable {
    var id: Int?
    var name, type: String?
}

// MARK: - HomePlantPotSize
struct HomePlantPotSize: Codable {
    var id, size: Int?
}

// MARK: - Detail
struct Detail: Codable {
    var id: Int?
    var type: String?
    var acidityType: FarmActivityType?
    var acidityValue: Int?
    var acidityUnit: Unit?
    var saltType: FarmingWay?
    var saltConcentrationValue: Int?
    var saltConcentrationUnit: Unit?
    var saltDetail: SaltDetail?

    enum CodingKeys: String, CodingKey {
        case id, type
        case acidityType = "acidity_type"
        case acidityValue = "acidity_value"
        case acidityUnit = "acidity_unit"
        case saltType = "salt_type"
        case saltConcentrationValue = "salt_concentration_value"
        case saltConcentrationUnit = "salt_concentration_unit"
        case saltDetail = "salt_detail"
    }
}

// MARK: - Location
struct Location: Codable {
    var id: Int?
    var latitude, longitude: Double?
    var country, city, district, details: String?
}

// MARK: - Post
struct Post: Codable {
    var id: Int?
    var content: String?
    var author: User?
    var farm: String?
    var farmedTypePhoto: String?
    var solved: Bool?
    var imageAssets: [String]?
    var videoAssets: [String]?
    var postType: String?
    var likersCount, dislikersCount, commentsCount: Int?
    var likers, dislikers: [String]?
    var comments: [Comment]?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, content, author, farm
        case farmedTypePhoto = "farmed_type_photo"
        case solved
        case imageAssets = "image_assets"
        case videoAssets = "video_assets"
        case postType = "post_type"
        case likersCount = "likers_count"
        case dislikersCount = "dislikers_count"
        case commentsCount = "comments_count"
        case likers, dislikers, comments
        case createdAt = "created_at"
    }
}


// MARK: - Comment
struct Comment: Codable {
    var id: Int?
    var content: String?
    var commenter: Commenter?
    var postID: Int?
    var assets: [String]?
    var repliesCount, likersCount, dislikersCount: Int?
    var likers, dislikers, replies: [String]?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, content, commenter
        case postID = "post_id"
        case assets
        case repliesCount = "replies_count"
        case likersCount = "likers_count"
        case dislikersCount = "dislikers_count"
        case likers, dislikers, replies
        case createdAt = "created_at"
    }
}

// MARK: - Commenter
struct Commenter: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var mobile: String?
    var activityPoints, humanJobID, emailVerified, mobileVerified: Int?
    var status: String?
    var emailVerifiedAt: String?
    var createdAt, updatedAt: String?
    var deletedAt: String?
    var isNotifiable: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, email, mobile
        case activityPoints = "activity_points"
        case humanJobID = "human_job_id"
        case emailVerified = "email_verified"
        case mobileVerified = "mobile_verified"
        case status
        case emailVerifiedAt = "email_verified_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case isNotifiable = "is_notifiable"
    }
}


// MARK: - ServiceTable
struct ServiceTable: Codable {
    var id: Int?
    var name: String?
    var farmID, tasksCount: Int?
    var tasks: [FarmTask]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case farmID = "farm_id"
        case tasksCount = "tasks_count"
        case tasks
    }
}

// MARK: - WeatherData
struct WeatherData: Codable {
    var weatherDescription: String?
    var weatherIconURL: String?
    var temp, date, sunrise, sunset: String?
    var location: String?

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "weather_description"
        case weatherIconURL = "weather_icon_url"
        case temp, date, sunrise, sunset, location
    }
}
