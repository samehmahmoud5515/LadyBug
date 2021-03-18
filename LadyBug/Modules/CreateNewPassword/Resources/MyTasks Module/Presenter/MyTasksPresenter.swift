//
//  MyTasksPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import Foundation

class MyTasksPresenter: MyTasksPresenterProtocol {
    var images = MyTasksImages()
    var localizer = MyTasksLocalizer()
    
    weak var view: MyTasksViewControllerProtocol?
    
    init(view: MyTasksViewControllerProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
}
