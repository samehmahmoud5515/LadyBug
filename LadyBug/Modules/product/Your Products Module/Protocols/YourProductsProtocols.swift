//
//  YourProductsProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import Foundation

protocol YourProductsPresenterProtocol {
    var localizer: YourProductsLocalizer { get }
    var images: YourProductsImage { get }
    var userProducts : [Products] {get}
    func attach()
    func getUserProducts()

}
protocol YourProductsViewProtocol: class {
    func reloadData()
    func stopIndicator()
}
