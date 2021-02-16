//
//  HomePresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var headerDatasource: [HeaderViewUIModel] = []
    var numberOfSectionsInHeader: Int = 2
    var postsDatasource: [String] = ["1","1","1","1","1","1"]
    
    weak var view: HomeViewProtocol?
    
    var images = HomeImages()
    var localizer = HomeLocalizer()
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func attach() {
        setupHeaderViewDatasource()
    }
    
    private func setupHeaderViewDatasource() {
        headerDatasource = [
            HeaderViewUIModel(title: localizer.avocado, image: images.avocado),
            HeaderViewUIModel(title: localizer.banana, image: images.banana),
            HeaderViewUIModel(title: localizer.grape, image: images.grape),
            HeaderViewUIModel(title: localizer.guava, image: images.guava),
            HeaderViewUIModel(title: localizer.kiwi, image: images.kiwi),
            HeaderViewUIModel(title: localizer.lemon, image: images.lemon),
            HeaderViewUIModel(title: localizer.orange, image: images.orange),
            HeaderViewUIModel(title: localizer.pineapple, image: images.pineapple),
            HeaderViewUIModel(title: localizer.watermelon, image: images.waterMelon)
        ]
    
        view?.notifyHeaderViewDatasourceChanged()
    }
}
