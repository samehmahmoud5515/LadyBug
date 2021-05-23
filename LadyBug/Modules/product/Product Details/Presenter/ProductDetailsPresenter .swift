//
//  ProductDetailsPresenter .swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/18/21.
//

import Foundation
class ProductDetailsPresenter : ProductDetailsPresenterProtocols{
    var localizer = ProductDetailsLocalizer()
    var images = ProductDetailsImages()
    weak var view : ProductDetailsViewProtocol?
    var datasource = [ProductDetailsUIModel]()
    var product = Product()
    init(view : ProductDetailsViewProtocol, product: Product) {
        self.view = view
        self.product = product
    }
    
    func attach() {
        prepareDatasource() 
    }
    func prepareDatasource() {
        
        let city = ProductInfo()
        city.title = localizer.city
        city.Content = product.city ?? ""
        datasource += [.city(city)]
        
        let region = ProductInfo()
        region.title = localizer.CityRegion
        region.Content = view?.setDataToTableView().district as! String
        datasource += [.region(region)]
        
        let suitableCrop = ProductInfo()
        suitableCrop.title = localizer.suitableCropTitle
        suitableCrop.Content = view?.setDataToTableView().farmedType as! String
        datasource += [.suitableCrop(suitableCrop)]
        
        let moreLinkes = ProductInfo()
        moreLinkes.title = localizer.productWebsiteLink
        moreLinkes.Content = localizer.pressHere
        datasource += [.moreLinkes(moreLinkes)]
    }
}
