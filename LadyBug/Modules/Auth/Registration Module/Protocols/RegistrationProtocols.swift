//
//  RegistrationProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

protocol RegistrationViewProtocol: class {
    func navigateToTabBarController()
}

protocol RegistrationPresenterProtocol: class {
    var localizer: RegistrationLocalizer { get }
    var images : ImageLocalizer{get}
    var jobId : [Int] {get}
    var jobName : [String] {get}
    func setNewUser(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String)
    func fetchJobs()
}
