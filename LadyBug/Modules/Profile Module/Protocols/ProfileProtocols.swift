//
//  ProfileProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import Foundation

protocol ProfilePresenterProtocol {
    var localizer: ProfileLocalizer { get }
    var images: ProfileImages { get }
    func attach()
}

protocol ProfileViewProtocol: class {
    
}
