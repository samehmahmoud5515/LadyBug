//
//  MyFarmProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import Foundation

protocol MyFarmPresenterProtocol: class {
    var images: MyFarmImages { get }
    var localizer: MyFarmLocalizer { get }
    func attach()
    func getFarmsDatasourceCount() -> Int
    func getFarms(for index: Int) 
}

protocol MyFarmViewProtocol: class {

}
