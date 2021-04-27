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
    func updateUser(name: String, email: String,humanJobId: String, photo: String)
}

protocol ProfileViewProtocol: class {
    
}
