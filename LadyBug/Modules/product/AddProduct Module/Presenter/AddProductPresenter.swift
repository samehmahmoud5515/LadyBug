//
//  AddProductPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import Moya
class AddProductPresenter: AddProductPresenterProtocol {
    
    weak var view: AddProductViewProtocol?
    var localizer = AddProductLocalizer()
    var images = AddProductImage()
    var datasource = [AddProductUIModel]()
    var cities = [City]()
    var farmedTypes = [FarmedType]()
    var provider = MoyaProvider<ProductsEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var selectedCity: City?
    var selectedRegion: District?
    var price: Double?
    var descriptionArLocalized: String?
    var descriptionEnLocalizedc: String?
    var nameArLocalized: String?
    var nameEnLocalized: String?
    var otherLinks: String?
    var sellerMobile: String?
    var internalAssets: [String]?
    var externalAssets: [String]?
    var selectedFarmedType: FarmedType?
    
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
        moreLinks.header = localizer.moreLinksContent
        moreLinks.titile = localizer.moreLinks
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
    
    func getCitysAndCrops() {
        provider.request(.citesAndCrops) {[weak self] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let productsRelationsResponse = try? moyaResponse.map(ProductsRelationsResponse.self)
                    guard let cities = productsRelationsResponse?.data?.cities else { return }
                    guard let farmedTypes = productsRelationsResponse?.data?.farmedTypes else { return }
                    self?.farmedTypes = farmedTypes
                    self?.cities = cities
                    self?.selectedCity = cities.first
                    self?.selectedRegion = cities.first?.districts?.first
                    self?.selectedFarmedType = farmedTypes.first
                    self?.view?.getProductsRelations()
                    self?.view?.notifiyDataChange()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
    
    func createProduct() {
        guard let price = self.price , let descriptionArLocalized = self.descriptionArLocalized , let nameArLocalized = self.nameArLocalized, let cityID = selectedCity?.id , let districtID = selectedRegion?.id , let otherLinks = self.otherLinks, let sellerMobile = self.sellerMobile,let internalAssets = self.internalAssets , let externalAssets = self.externalAssets, let farmedTypeID = selectedFarmedType?.id else {return}
        
        provider.request(.createProduct(price: price, descriptionArLocalized: descriptionArLocalized, descriptionEnLocalized: self.descriptionEnLocalizedc ?? "" , nameArLocalized: nameArLocalized, nameEnLocalized: self.nameEnLocalized ?? "", cityID: cityID, districtID: districtID, otherLinks: otherLinks, sellerMobile: sellerMobile, internalAssets: internalAssets, externalAssets: externalAssets, farmedTypeID: farmedTypeID)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let productsResponse = try? moyaResponse.map(ProductsResponse.self)
                    guard let products = productsResponse?.data else { return }
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
    
 
}
