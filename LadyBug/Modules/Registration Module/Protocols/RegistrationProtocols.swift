//
//  RegistrationProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation
protocol RegistrationPresenterProtocol:RegistrationHeaderDelegate {
  
    var localizer: RegistrationLocalizer { get }
    var images: RegistrationImages{ get }
    func attach()
}

protocol RegistrationHeaderDelegate: class {
    
}

protocol RegistrationViewProtocol: class {
}
