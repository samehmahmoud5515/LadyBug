//
//  FollowersPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

class FarmPersonSelectionPresenter:FarmPersonSelectionPresenterProtocols{
    var localizer = FarmPersonSelectionLocalizer()
    var images =  FarmPersonSelectionImage()
    
    weak var view :FarmPersonSelectionViewProtocol?
    
    init(view : FarmPersonSelectionViewProtocol ){
        self.view = view 
    }
    
    func attach() {
    }
    
    func getFarmPersonSelectionCount() -> Int {
        return 2
    }

}
