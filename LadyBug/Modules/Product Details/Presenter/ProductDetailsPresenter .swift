//
//  ProductDetailsPresenter .swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/18/21.
//

import Foundation
class ProductDetailsPresenter : ProductDetailsPresenterProtocol{
    var Localizer = ProductDetailsLocalizer()
    var images = ProductDetailsImages()
    weak var view : ProductDetailsViewProtocol?
    init(view : ProductDetailsViewProtocol ){
          self.view = view
      }
    func attach() {
    }
}
