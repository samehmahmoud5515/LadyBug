//
//  VideosPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

class VideosPresenter: VideosPresenterProtocol {

    var numberOfSectionsInHeader: Int = 2
    var postsDatasource: [String] = ["1","1","1","1","1","1"]
    
    weak var view: VideosViewProtocol?
    
    var images = VideosImages()
    var localizer = VideosLocalizer()
    
    init(view: VideosViewProtocol) {
        self.view = view
    }
    
    func attach() {

    }
    
    func setupCellUI(_ cell: VideosCellProtocol, index: Int) {
        cell.setupUI(localizer: localizer)
    }
    
    func didTappedCell(with index: Int) {
        view?.navigateToPostDetails()
    }
}
