//
//  LoginPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/18/21.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?

    init(view: LoginViewProtocol) {
       self.view = view
    }
    
    func login(with username: String, password: String) {
        if username == Defaults[.username] && Defaults[.password] == password {
            Defaults[.isUserLogged] = true
            view?.navigateToTabBarController()
        }
    }    
}
