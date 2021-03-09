//
//  FollowersPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

class FollowersPresenter:FollowersPresenterProtocols{
    var localizer = FollowersLocalizer()
    var images =  FollowersImage()
    
    weak var view : FollowersViewProtocol?
    
    init(view : FollowersViewProtocol ){
        self.view = view 
    }
    
    func attach() {
    }
    
    func getFollowersCount() -> Int {
        return 2
    }

}
