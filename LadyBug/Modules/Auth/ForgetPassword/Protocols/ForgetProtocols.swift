//
//  ForgetProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

protocol ForgetPasswordPresenterProtocol {
    var localizer: ForgetPasswordLocalizer { get }
    var images: ForgetPasswordImages { get }
    func attach()
    func forgetPassword( email: String)
}

protocol ForgetPasswordViewProtocol: class {
    func navigateToCreateNewPassword()

}
