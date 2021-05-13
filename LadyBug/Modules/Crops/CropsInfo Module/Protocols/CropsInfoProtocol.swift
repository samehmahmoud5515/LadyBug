//
//  CropsInfoProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import Foundation

protocol CropsInfoPresenterProtocol {
    var images: CropsInfoImages { get }
    var localizer: CropsInfoLocalizer { get }
    func attach()
}

protocol CropsInfoViewProtocol: class {
    
}
