//
//  ProductsPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Moya

class ProductsPresenter: ProductsPresenterProtocol {
    
    var localizer = ProductsLocalizer()
    var images = ProductsImages()
    let productsProvider = MoyaProvider<ProductsEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var products = [Products]()
    weak var view: ProductsViewProtocol?
    
    init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    
    func getProductsCount() -> Int {
        return 10
    }
    
    func getproducts() {
        productsProvider.request(.products) { result in
               switch result {
               case let .success(moyaResponse):
                   do {
                       let productsResponse = try? moyaResponse.map(ProductsResponse.self)
                       guard let products = productsResponse?.data?.all else { return }
                       self.products = products
                       print(self.products)
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
