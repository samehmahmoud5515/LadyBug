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
        datasource += [.AddImage(addImage)]
        
        let productTitle = AddProductModel()
        productTitle.header = localizer.ProductHead
        productTitle.titile = localizer.ProductHeadcontent
        datasource += [.productTitle(productTitle)]
        
        let appropriateCrop = AddProductModel()
        appropriateCrop.header = localizer.appropriateCrop
        appropriateCrop.titile = localizer.appropriateCropContent
        datasource += [.AppropriateCrop(appropriateCrop)]
        
        let city = AddProductModel()
        city.header = localizer.choiceCity
        city.titile = localizer.cityContent
        datasource += [.City(city)]
        
       let region = AddProductModel()
        region.header = localizer.region
        region.titile = localizer.regionContent
        datasource += [.Region(region)]
        
        let moreLinks = AddProductModel()
        moreLinks.header = localizer.moreLinks
        moreLinks.titile = localizer.moreLinksContent
        datasource += [.OtherSites(moreLinks)]
        
        let descriptions = AddProductModel()
        descriptions.header = localizer.description
        descriptions.titile = localizer.descriptionsContent
        datasource += [.Description(descriptions)]
        
        let phoneNumber = AddProductModel()
        phoneNumber.header = localizer.phoneNumberLabel
        phoneNumber.titile = localizer.phoneNumberContent
        datasource += [.PhoneNumber(phoneNumber)]
        
        let price = AddProductModel()
        price.header = localizer.price
        price.titile = localizer.priceContent
        datasource += [.Price(price)]
        
        view?.notifiyDataChange()
      }
    func handleCellDidTapped(index: Int) {
           
       }
    func getItemFor(index: Int) -> AddProductUIModel {
           return datasource[index]
       }
}
