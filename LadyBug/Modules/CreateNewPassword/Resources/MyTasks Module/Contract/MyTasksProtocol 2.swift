//
//  WeatherProtocol.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import Foundation

protocol MyTasksPresenterProtocol {
    var images: MyTasksImages { get }
    var localizer: MyTasksLocalizer { get }
    func attach()
}

protocol MyTasksViewControllerProtocol: class {
    
}
