//
//  AddProductPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import Foundation
class AddProductPresenter: AddProductPresenterProtocol {
    
    
    
    weak var view: AddProductViewProtocol?
    var localizer = AddProductLocalizer()
    var images = AddProductImage()
    var datasource = [AddProductUIModel]()
    
    init(view: AddProductViewProtocol) {
        self.view = view
    }
    
    func attach() {
        prepareDatasource()
    }
    
    func prepareDatasource() {
        
        let addImage = AddProductModel()
        datasource += [.addImage(addImage)]
        
        let productTitle = AddProductModel()
        productTitle.header = localizer.productHeadcontent
        productTitle.titile = localizer.productHead
        datasource += [.productTitle(productTitle)]
        
        let appropriateCrop = AddProductModel()
        appropriateCrop.header = localizer.appropriateCrop
        appropriateCrop.titile = localizer.appropriateCropContent 
        datasource += [.appropriateCrop(appropriateCrop)]
        
        let city = AddProductModel()
        city.header = localizer.choiceCity
        city.titile = localizer.cityContent
        datasource += [.city(city)]
        
        let region = AddProductModel()
        region.header = localizer.region
        region.titile = localizer.regionContent
        datasource += [.region(region)]
        
        let moreLinks = AddProductModel()
        moreLinks.header = localizer.moreLinks
        moreLinks.titile = localizer.moreLinksContent
        datasource += [.otherSites(moreLinks)]
        
        let descriptions = AddProductModel()
        descriptions.header = localizer.description
        descriptions.titile = localizer.descriptionsContent
        datasource += [.description(descriptions)]
        
        let phoneNumber = AddProductModel()
        phoneNumber.header = localizer.phoneNumberContent
        phoneNumber.titile = localizer.phoneNumberLabel
        datasource += [.phoneNumber(phoneNumber)]
        
        let price = AddProductModel()
        price.header = localizer.priceContent
        price.titile = localizer.price
        datasource += [.price(price)]
        
        view?.notifiyDataChange()
    }
    func handleCellDidTapped(index: Int) {
        
    }
    func getItemFor(index: Int) -> AddProductUIModel {
        return datasource[index]
    }
}
