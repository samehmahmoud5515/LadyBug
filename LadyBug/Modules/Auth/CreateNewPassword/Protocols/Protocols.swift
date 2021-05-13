//
//  Protocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import Foundation
protocol CreateNewPasswordPresenterprotocol  {
    var localizer: CreateNewPasswordLocalizer { get }
    var image: CreateNewPasswordImages{ get }
    func attach()
    func createNewPassword( password: String)
}
protocol CreateNewPasswordViewProtocol: class{
        func navigateToLoginController()
}
