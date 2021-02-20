//
//  ProductsPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

class ProductsPresenter: ProductsPresenterProtocol {
    var localizer = ProductsLocalizer()
    var images = ProductsImages()
    
    weak var view: ProductsViewProtocol?
    
    init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    
    func getProductsCount() -> Int {
        return 10
    }
}
