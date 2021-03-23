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
    init(view : ProductDetailsViewProtocol ){
        self.view = view
    }
    func attach() {
        prepareDatasource() 
    }
    func prepareDatasource() {
        
        let city = ProductInfo()
        city.title = localizer.city
        city.Content = localizer.cityContent
        datasource += [.city(city)]
        
        let region = ProductInfo()
        region.title = localizer.CityRegion
        region.Content = localizer.CityRegionContent
        datasource += [.region(region)]
        
        let suitableCrop = ProductInfo()
        suitableCrop.title = localizer.suitableCropTitle
        suitableCrop.Content = localizer.suitableCropContent
        datasource += [.suitableCrop(suitableCrop)]
        
        let moreLinkes = ProductInfo()
        moreLinkes.title = localizer.productWebsiteLink
        moreLinkes.Content = localizer.pressHere
        datasource += [.moreLinkes(moreLinkes)]
    }
}
