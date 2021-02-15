//
//  HomePresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var headerDatasource: [String] = ["1","1","1","1","1","1","1","1","1"]
    
    var numberOfSectionsInHeader: Int = 1
    
    
    weak var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
}
