//
//  ProductDetailsProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/18/21.
//

import Foundation
protocol  ProductDetailsViewProtocol: class {
    
}
protocol ProductDetailsPresenterProtocol: class  {
    var Localizer: ProductDetailsLocalizer  { get }
    var images: ProductDetailsImages {get}
    func attach()
    
}
