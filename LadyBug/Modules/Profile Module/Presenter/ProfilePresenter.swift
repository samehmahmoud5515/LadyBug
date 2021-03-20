//
//  ProfilePresenter.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    
    var localizer = ProfileLocalizer()
    
    var images = ProfileImages()
    
    init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
}
