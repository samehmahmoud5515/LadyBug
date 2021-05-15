//
//  AddProductProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//
import Foundation
protocol  AddProductPresenterProtocol {
    var localizer: AddProductLocalizer { get }
    var images: AddProductImage { get }
    var datasource: [AddProductUIModel] { get }
    var cities: [City]{get}
    var farmedTypes: [FarmedType] {get}
    func handleCellDidTapped(index: Int)
    func attach()
    func getItemFor(index: Int) -> AddProductUIModel
    func createProduct(product : Products)
    func getCitysAndCrops()
}

protocol  AddProductViewProtocol: class {
    func notifiyDataChange()
    func naviageteTo(model: AddProductUIModel)
    func stopIndicator()
    func getProductsRelations()
    func didSelectItem(item: String) 
}

