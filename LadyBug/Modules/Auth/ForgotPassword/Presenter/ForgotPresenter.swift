//
//  ForgotPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Foundation

class ForgotPresenter: ForgotPresenterProtocol {
    
    weak var view: ForgotViewProtocol?

    var images = ForgotImages()
    var localizer = ForgotLocalizer()
    
    
    init(view: ForgotViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    
}
