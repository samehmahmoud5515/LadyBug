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
            HeaderViewUIModel(image: images.avocado, title: localizer.avocado),
            HeaderViewUIModel(image: images.banana, title: localizer.banana),
            HeaderViewUIModel(image: images.grape, title: localizer.grape),
            HeaderViewUIModel(image: images.guava, title: localizer.guava),
            HeaderViewUIModel(image: images.kiwi, title: localizer.kiwi),
            HeaderViewUIModel(image: images.lemon, title: localizer.lemon),
            HeaderViewUIModel(image: images.orange, title: localizer.orange),
            HeaderViewUIModel(image: images.pineapple, title: localizer.pineapple),
            HeaderViewUIModel(image: images.waterMelon, title: localizer.watermelon)
        ]
    
        view?.notifyHeaderViewDatasourceChanged()
    }
    
    func setupCellUI(_ cell: HomePostsCellProtocol, index: Int) {
        cell.setupUI(localizer: localizer)
    }
    
    func didTappedCell(with index: Int) {
        
    }
}
