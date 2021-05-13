//
//  MyFarmPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import Foundation

class MyFarmPresenter: MyFarmPresenterProtocol {
    
    weak var view: MyFarmViewProtocol?
    let images = MyFarmImages()
    let localizer = MyFarmLocalizer()
    
    init(view: MyFarmViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    func getFarmsDatasourceCount() -> Int {
        return 10
    }
    
    func getFarms(for index: Int) {
        
    }
}
