//
//  CreateFarmProtcol.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Foundation

protocol CreateFarmPresenterProtocol {
    var images: CreateFramImages { get }
    var localizer: CreateFarmLocalizer { get }
    func attach()
}

protocol CreateFarmViewProtocol: class {
    
}
