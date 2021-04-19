//
//  RegistrationProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

protocol RegistrationViewProtocol: class {
   
}

protocol RegistrationPresenterProtocol: class {
   var localizer: RegistrationLocalizer { get }
    var images : ImageLocalizer{get}
    func registration(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String)
}
