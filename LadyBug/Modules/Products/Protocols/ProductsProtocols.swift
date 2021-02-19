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
    func attach()
    func getProductsCount() -> Int
}

protocol ProductsViewProtocol: class {
    
}
