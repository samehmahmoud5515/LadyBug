//
//  Protocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/18/21.
//

import Foundation

protocol LoginViewProtocol: class {
    func navigateToTabBarController()
}

protocol LoginPresenterProtocol: class {
    var localizer: loginLocalizer { get }
    var images: LoginImages { get }
    func login(with username: String, password: String)
}
