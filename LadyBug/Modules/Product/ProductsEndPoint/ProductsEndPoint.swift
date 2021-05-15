//
//  ProductsEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/13/21.
//
import Moya
enum ProductsEndPoint {
    case products
    case userProducts
    case getProducts(productId : Int )
    case getProductsRelations
    case createProduct(product : Products)
    case updateProduct(productId : Int, product : Products)
    case sellProducts(productId : Int)
    case citesAndCrops
}

extension ProductsEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .products:
            return "/api/v1/products"
        case .userProducts:
            return "/api/v1/users/products/index"
        case let .getProducts(productId) :
            return "/api/v1/products/" + String(productId)
        case .getProductsRelations:
            return "/api/v1/products/relations/index"
        case .createProduct:
            return "/api/v1/products"
        case let .updateProduct(productId, product) :
            return "/api/v1/products/" + String(productId)
        case let .sellProducts(productId):
            return "/api/v1/products/toggle_sell/" + String(productId)
        case .citesAndCrops:
            return "/api/v1/products/relations/index"
        }
    }
    
    var method: Method {
        switch self {
        case .products:
            return .get
        case .userProducts:
            return .get
        case .getProducts:
            return .get
        case .getProductsRelations:
            return .get
        case .createProduct:
            return .post
        case .updateProduct:
            return .post
        case .sellProducts:
            return .get
        case .citesAndCrops:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .products:
            return .requestPlain
        case .userProducts:
            return .requestPlain
        case .getProducts:
            return .requestPlain
        case .getProductsRelations:
            return .requestPlain
        case let .createProduct(product):
            let paramters = ["price": product.price , "description_ar_localized": product.descriptionArLocalized , "description_en_localized": product.descriptionEnLocalized, "name_ar_localized": product.nameArlocalized, "name_en_localized": product.nameEnLocalized, "city_id": product.cityID, "district_id": product.districtID , "other_links": product.otherLinks , "seller_mobile": product.sellerMobile , "internal_assets": product.internalAssets , "external_assets": product.externalAssets , "farmed_type_id": product.farmedTypeId ] as [String : Any]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        case let .updateProduct(productId, product) :
            let paramters = ["price": product.price , "description_ar_localized": product.descriptionArLocalized , "description_en_localized": product.descriptionEnLocalized, "name_ar_localized": product.nameArlocalized, "name_en_localized": product.nameEnLocalized, "city_id": product.cityID, "district_id": product.districtID , "other_links": product.otherLinks , "seller_mobile": product.sellerMobile , "internal_assets": product.internalAssets , "external_assets": product.externalAssets , "farmed_type_id": product.farmedTypeId ] as [String : Any]
            return .requestParameters(parameters: paramters, encoding: JSONEncoding.default)
        case  .sellProducts:
            return .requestPlain
        case .citesAndCrops:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        .bearer
    }
}

