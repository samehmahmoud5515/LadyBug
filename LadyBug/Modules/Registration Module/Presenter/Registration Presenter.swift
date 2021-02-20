//
//  Registration Presenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

class RegistrationPresenter: RegistrationPresenterProtocol {
 
    weak var view: RegistrationViewProtocol?

    var images = RegistrationImages()
    var localizer = RegistrationLocalizer()
    
    
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    
   
}
