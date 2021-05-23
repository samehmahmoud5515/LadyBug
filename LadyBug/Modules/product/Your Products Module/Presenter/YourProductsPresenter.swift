//
//  YourProductsPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import Moya

class YourProductsPresenter:YourProductsPresenterProtocol{
  
    var localizer =  YourProductsLocalizer()
    var images =  YourProductsImage()
    weak var view : YourProductsViewProtocol?
    let userProductsProvider = MoyaProvider<ProductsEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var userProducts = [Product]()
    func attach() {
    }
    init(view: YourProductsViewProtocol) {
           self.view = view
    }
    func getUserProducts() {
        userProductsProvider.request(.userProducts) { result in
                         switch result {
                         case let .success(moyaResponse):
                             do {
                                 let productsResponse = try? moyaResponse.map(ProductsResponse.self)
                                 guard let products = productsResponse?.data?.all else { return }
                                 self.userProducts = products
                                 self.view?.reloadData()
                                 self.view?.stopIndicator()
                             } catch {
                                 print("Parsing Error")
                             }
                         case let .failure(error):
                             self.view?.stopIndicator()
                             break
                         }
                     }
                 }
       }
       

