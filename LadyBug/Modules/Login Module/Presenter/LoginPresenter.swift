//
//  LoginPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/18/21.
//

import Foundation
    
 class LoginPresenter: LoginPresenterProtocol {
    
     weak var view: LoginViewProtocol?

     var images = LoginImages()
     var localizer = LoginLocalizer()
     
     
     init(view: LoginViewProtocol) {
         self.view = view
     }
     
     func attach() {

    }
   
 }
