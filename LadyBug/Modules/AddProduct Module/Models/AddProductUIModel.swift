//
//  AddProductUIModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import Foundation

    enum AddProductUIModel {
        case AddImage(AddProductModel)
        case productTitle(AddProductModel)
        case AppropriateCrop(AddProductModel)
        case City(AddProductModel)
        case Region(AddProductModel)
        case OtherSites(AddProductModel)
        case Description(AddProductModel)
        case PhoneNumber(AddProductModel)
        case Price(AddProductModel)
    }
