//
//  CropsInfoPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import Foundation

class CropsInfoPresenter: CropsInfoPresenterProtocol {
    var images = CropsInfoImages()
    
    var localizer = CropsInfoLocalizer()
    
    weak var view: CropsInfoViewProtocol?
    
    init(view: CropsInfoViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    
    
}
