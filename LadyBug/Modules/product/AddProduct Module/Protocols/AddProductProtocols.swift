//
//  AddProductProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import Foundation
import UIKit

protocol AddProductPresenterProtocol {
    var localizer: AddProductLocalizer { get }
    var images: AddProductImage { get }
    var datasource: [AddProductUIModel] { get }
    var cities: [City]{get}
    var selectedCity: City? { get set }
    var selectedRegion: District? { get set }
    var price: String? { get set }
    var descriptionArLocalized: String?{ get set }
    var descriptionEnLocalizedc: String?{ get set }
    var nameArLocalized: String?{ get set }
    var nameEnLocalized: String?{ get set }
    var otherLinks: String?{ get set }
    var sellerMobile: String?{ get set }
    var selectedInternalAssetUrl: MediaUpload? { get set }
    var selectedExternalAssetUrl: MediaUpload? { get set }
    var selectedFarmedType: FarmedType?{ get set }
    var farmedTypes: [FarmedType] {get}
    func handleCellDidTapped(index: Int)
    func attach()
    func getItemFor(index: Int) -> AddProductUIModel
    func createProduct()
    func getCitysAndCrops()
}

protocol AddProductViewProtocol: class {
    func notifiyDataChange()
    func naviageteTo(model: AddProductUIModel)
    func stopIndicator()
    func getProductsRelations()
    func didSelectItem(item: String)
    func navigateToAddProduct(product: Product)
}

protocol AddProductImageProtocol : class  {
    func addImageButtonDidTapped(_ cell: AddImageTableViewCell)
}

struct MediaUpload {
    var image: UIImage
    var fileName: String
}
