//
//  MyFarmDetailsProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 04/03/2021.
//

import Foundation

protocol MyFarmDetailsPresenterProtocol {
    var images: MyFarmDetailsImages { get }
    var localizer: MyFarmDetailsLocalizer { get }
    var datasource: [MyFarmDetailsUIModel] { get }
    func attach()
    func getUserInFarm() -> [User]
    func getFarmDetailsUIModel() -> [FarmUIModel]
    func getFarmPosts() -> [Post]
    func getServiceTables() -> [ServiceTable]
}

protocol MyFarmDetailsViewProtocol: class {
    
}
