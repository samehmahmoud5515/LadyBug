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
    case getProducts(productId: Int)
    case getProductsRelations
    case createProduct(price: String, descriptionArLocalized : String, descriptionEnLocalized : String, nameArLocalized: String, nameEnLocalized: String, cityID: Int, districtID: Int, otherLinks: String, sellerMobile: String, internalAssets: MediaUpload?, externalAssets: MediaUpload?, farmedTypeID: Int)
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
        case let .sellProducts(productId):
            return "/api/v1/products/toggle_sell/" + String(productId)
        case .citesAndCrops:
            return "/api/v1/products/relations/index"
        }
    }
    
    var method: Method {
        switch self {
        case .products, .userProducts, .getProducts, .getProductsRelations, .sellProducts, .citesAndCrops:
            return .get
        case .createProduct:
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .products, .userProducts, .getProducts, .getProductsRelations, .sellProducts, .citesAndCrops:
            return .requestPlain
        case let .createProduct(price, descriptionArLocalized, descriptionEnLocalized, nameArLocalized, nameEnLocalized, cityID, districtID, otherLinks, sellerMobile, internalAssets, externalAssets, farmedTypeID):

            var formData: [Moya.MultipartFormData] = []
            if let externalAssetsData = externalAssets?.image.jpegData(compressionQuality: 0) {
                formData.append(Moya.MultipartFormData(provider: .data(externalAssetsData), name: "external_assets[]", fileName: externalAssets?.fileName ?? "", mimeType: "image/jpeg"))
            }
            
            if let internalAssetsData = internalAssets?.image.jpegData(compressionQuality: 0.1) {
                formData.append(Moya.MultipartFormData(provider: .data(internalAssetsData), name: "internal_assets[]", fileName: internalAssets?.fileName ?? "", mimeType: "image/jpeg"))
            }
            
            let priceData = price.data(using: .utf8) ?? Data()
            let descriptionArLocalizedData = descriptionArLocalized.data(using: .utf8) ?? Data()
            let descriptionEnLocalizedData = descriptionEnLocalized.data(using: .utf8) ?? Data()
            let nameArLocalizedData = nameArLocalized.data(using: .utf8) ?? Data()
            let nameEnLocalizedData = nameEnLocalized.data(using: .utf8) ?? Data()
            let cityIdData = "\(cityID)".data(using: .utf8) ?? Data()
            let districtIdData = "\(districtID)".data(using: .utf8) ?? Data()
            let otherLinksData = otherLinks.data(using: .utf8) ?? Data()
            let sellerMobileData = sellerMobile.data(using: .utf8) ?? Data()
            let farmedTypeIdData = "\(farmedTypeID)".data(using: .utf8) ?? Data()
            
            formData.append(Moya.MultipartFormData(provider: .data(priceData), name: "price"))
            formData.append(Moya.MultipartFormData(provider: .data(descriptionArLocalizedData), name: "description_ar_localized"))
            formData.append(Moya.MultipartFormData(provider: .data(descriptionEnLocalizedData), name: "description_en_localized"))
            formData.append(Moya.MultipartFormData(provider: .data(nameArLocalizedData), name: "name_ar_localized"))
            formData.append(Moya.MultipartFormData(provider: .data(nameEnLocalizedData), name: "name_en_localized"))
            formData.append(Moya.MultipartFormData(provider: .data(cityIdData), name: "city_id"))
            formData.append(Moya.MultipartFormData(provider: .data(districtIdData), name: "district_id"))
            formData.append(Moya.MultipartFormData(provider: .data(otherLinksData), name: "other_links"))
            formData.append(Moya.MultipartFormData(provider: .data(sellerMobileData), name: "seller_mobile"))
            formData.append(Moya.MultipartFormData(provider: .data(farmedTypeIdData), name: "farmed_type_id"))
            
            return .uploadMultipart(formData)
        }
    }
    
    var headers: [String : String]? {
        var headers = commonHeader
        switch self {
        case .createProduct:
            headers.updateValue("application/json", forKey: "Content-Type")
        default:
            break
        }
        return headers
    }
    
    var authorizationType: AuthorizationType {
        .bearer
    }
}
