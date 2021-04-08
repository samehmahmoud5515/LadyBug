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
    func handleCellDidTapped(index: Int)
    func attach()
    func getItemFor(index: Int) -> AddProductUIModel
}

protocol  AddProductViewProtocol: class {
    func notifiyDataChange()
    func naviageteTo(model: AddProductUIModel)
}

