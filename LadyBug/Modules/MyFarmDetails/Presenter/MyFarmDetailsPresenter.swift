//
//  MyFarmDetailsPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 04/03/2021.
//

import Foundation

class MyFarmDetailsPresenter: MyFarmDetailsPresenterProtocol {
    
    var images = MyFarmDetailsImages()
    var localizer = MyFarmDetailsLocalizer()
    var datasource: [MyFarmDetailsUIModel] = [.name, .details, .suitability, .people, .posts, .tasks]
    weak var view: MyFarmDetailsViewProtocol?
    
    init(view: MyFarmDetailsViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
}
