//
//  PostEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/22/21.
//

import Moya

enum PostsEndPoint {
    case getUserPosts
//    case userProducts
//    case getProducts(productId : Int )
//    case getProductsRelations
//    case createProduct( price: Double, descriptionArLocalized : String, descriptionEnLocalized : String, nameArLocalized: String, nameEnLocalized: String, cityID: Int, districtID: Int , otherLinks: String , sellerMobile: String , internalAssets : [String] , externalAssets: [String] , farmedTypeID: Int )
//    case updateProduct(productId : Int, product : Products)
//    case sellProducts(productId : Int)
//    case citesAndCrops
}

extension PostsEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .getUserPosts:
            return "/api/v1/users/posts/index"
//        case .userProducts:
//            return "/api/v1/users/products/index"
//        case let .getProducts(productId) :
//            return "/api/v1/products/" + String(productId)
//        case .getProductsRelations:
//            return "/api/v1/products/relations/index"
//        case .createProduct:
//            return "/api/v1/products"
//        case let .updateProduct(productId, product) :
//            return "/api/v1/products/" + String(productId)
//        case let .sellProducts(productId):
//            return "/api/v1/products/toggle_sell/" + String(productId)
//        case .citesAndCrops:
//            return "/api/v1/products/relations/index"
        }
    }
    
    var method: Method {
        switch self {
        case .getUserPosts:
            return .get
//        case .userProducts:
//            return .get
//        case .getProducts:
//            return .get
//        case .getProductsRelations:
//            return .get
//        case .createProduct:
//            return .post
//        case .updateProduct:
//            return .post
//        case .sellProducts:
//            return .get
//        case .citesAndCrops:
//            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getUserPosts:
            return .requestPlain
//        case .userProducts:
//            return .requestPlain
//        case .getProducts:
//            return .requestPlain
//        case .getProductsRelations:
//            return .requestPlain
//        case let .createProduct( price, descriptionArLocalized, descriptionEnLocalized, nameArLocalized, nameEnLocalized, cityID, districtID, otherLinks, sellerMobile, internalAssets, externalAssets, farmedTypeID):
//            let paramters = ["price": price , "description_ar_localized": descriptionArLocalized , "description_en_localized": descriptionEnLocalized, "name_ar_localized": nameArLocalized, "name_en_localized": nameEnLocalized, "city_id": cityID, "district_id": districtID , "other_links": otherLinks , "seller_mobile": sellerMobile , "internal_assets": internalAssets , "external_assets": externalAssets , "farmed_type_id": farmedTypeID ] as [String : Any]
//            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
//        case let .updateProduct(productId, product) :
//            let paramters = ["price": product.price , "description_ar_localized": product.descriptionArLocalized , "description_en_localized": product.descriptionEnLocalized, "name_ar_localized": product.nameArlocalized, "name_en_localized": product.nameEnLocalized, "city_id": product.cityID, "district_id": product.districtID , "other_links": product.otherLinks , "seller_mobile": product.sellerMobile , "internal_assets": product.internalAssets , "external_assets": product.externalAssets , "farmed_type_id": product.farmedTypeId ] as [String : Any]
//            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
//        case  .sellProducts:
//            return .requestPlain
//        case .citesAndCrops:
//            return .requestPlain
        }
    }
    var headers: [String : String]? {
        
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        .bearer
    }
}
