//
//  CreateFramPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Foundation

class CreateFramPresenter: CreateFarmPresenterProtocol {
    var images = CreateFramImages()
    var localizer = CreateFarmLocalizer()
    
    weak var view: CreateFarmViewProtocol?
    
    init(view: CreateFarmViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
}
