//
//  CreateNewPasswordPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import Foundation
class CreateNewPasswordPresenter : CreateNewPasswordPresenterPrototocol{
    var localizer = CreateNewPasswordLocalizer()
    var image =  CreateNewPasswordImages()
    
    weak var view : CreateNewPasswordViewProtocol?

    init(view : CreateNewPasswordViewProtocol ){
           self.view = view
       }
    
    func attach() {
    }
    func login(with newPassword: String, confirmNewpassword: String){
        if newPassword == Defaults[.username] && Defaults[.password] == confirmNewpassword {
        Defaults[.isUserLogged] = true
        view?.navigateToTabBarController()
        
    }

    }
    
}
