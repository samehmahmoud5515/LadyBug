//
//  RegistrationProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

protocol RegistrationViewProtocol: class {
    func navigateToTabBarController()
    func setselectProfessionSelectionView()
    func stopIndicator()
}

protocol RegistrationPresenterProtocol: class {
    var localizer: RegistrationLocalizer { get }
    var images : ImageLocalizer{get}
    var jobs : [JobsInfo] {get}
    var userImage: MediaUpload?{get set}
    func setNewUser(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String)
    func fetchJobs()
}
