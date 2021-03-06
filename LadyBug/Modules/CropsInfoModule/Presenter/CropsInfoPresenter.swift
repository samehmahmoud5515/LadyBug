//
//  CropsInfoPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

class CropsInfoPresenter:CropsInfoPresenterProtocol{
    var localizer = CropsInfoLocalizer()
    var images = CropsInfoImages()
    weak var view : CropsInfoViewProtocol?
    init(view : CropsInfoViewProtocol) {
        self.view = view 
    }
    func attach() {
    }
    
   
}
