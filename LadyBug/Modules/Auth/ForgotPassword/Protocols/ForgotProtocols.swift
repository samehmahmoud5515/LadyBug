//
//  ForgotProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

protocol ForgotPresenterProtocol {
    var localizer: ForgotLocalizer { get }
    var images: ForgotImages{ get }
    func attach()
    func forgotPassword( email: String)
}

protocol ForgotViewProtocol: class {
    
}
