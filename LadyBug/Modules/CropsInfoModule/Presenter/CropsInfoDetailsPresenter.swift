//
//  CropsInfoPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

class CropsInfoDetailsPresenter:CropsInfoDetailsPresenterProtocol{
    var localizer = CropsInfoDetailsLocalizer()
    var images = CropsInfoDetailsImages()
    weak var view : CropsInfoViewProtocol?
    init(view : CropsInfoViewProtocol) {
        self.view = view 
    }
    func attach() {
    }
    
   
}
