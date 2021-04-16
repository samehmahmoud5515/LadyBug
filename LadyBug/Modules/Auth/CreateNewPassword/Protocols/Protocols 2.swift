//
//  Protocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import Foundation
protocol CreateNewPasswordPresenterPrototocol {
    var localizer: CreateNewPasswordLocalizer { get }
    var image: CreateNewPasswordImages{ get }
    func attach()
    func login(with newPassword: String, confirmNewpassword: String)
}
protocol CreateNewPasswordViewProtocol: class{
        func navigateToTabBarController()
}
