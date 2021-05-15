//
//  ProductsProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

protocol ProductsPresenterProtocol {
    var localizer: ProductsLocalizer { get }
    var images: ProductsImages { get }
    var products : [Products] {get}
    func attach()
    func getProductsCount() -> Int
    func getproducts()
}

protocol ProductsViewProtocol: class {
    func reloadData()
    func stopIndicator()
}
