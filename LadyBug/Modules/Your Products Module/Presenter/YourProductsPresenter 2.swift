//
//  YourProductsPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import Foundation
class YourProductsPresenter:YourProductsPresenterProtocol{
    var localizer =  YourProductsLocalizer()
    var images =  YourProductsImage()
    weak var view : YourProductsViewProtocol?
    func attach() {
    }
    init(view: YourProductsViewProtocol) {
           self.view = view
    }
    func getYourProductsCount() -> Int {
        return 10
    }
}
