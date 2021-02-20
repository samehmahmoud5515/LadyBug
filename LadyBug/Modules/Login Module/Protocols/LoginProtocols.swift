//
//  Login Protocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/18/21.
//

import Foundation


protocol LoginPresenterProtocol{
    var localizer: LoginLocalizer { get }
    var images: LoginImages{ get }
    func attach()
}

protocol LoginViewProtocol: class {
   func notifyHeaderViewDatasourceChanged()
}
