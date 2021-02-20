//
//  MoreMenuPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

class MoreMenuPresenter: MoreMenuPresenterProtocol {
    
    weak var view: MoreMenuViewProtocol?
    var localizer = MoreMenuLocalizer()
    var images = MoreMenuImages()
    
    
    init(view: MoreMenuViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    

}
