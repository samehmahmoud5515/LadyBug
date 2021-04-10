//
//  AddProductUIModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import Foundation

    enum AddProductUIModel {
        case addImage(AddProductModel)
        case productTitle(AddProductModel)
        case appropriateCrop(AddProductModel)
        case city(AddProductModel)
        case region(AddProductModel)
        case otherSites(AddProductModel)
        case description(AddProductModel)
        case phoneNumber(AddProductModel)
        case price(AddProductModel)
    }
