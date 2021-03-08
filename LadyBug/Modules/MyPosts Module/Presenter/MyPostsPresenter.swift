//
//  VideosPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

class MyPostsPresenter: MyPostsPresenterProtocol {

    var numberOfSectionsInHeader: Int = 2
    var postsDatasource: [String] = ["1","1","1","1","1","1"]
    
    weak var view: MyPostsViewProtocol?
    
    var images = MyPostsImages()
    var localizer = MyPostsLocalizer()
    
    init(view: MyPostsViewProtocol) {
        self.view = view
    }
    
    func attach() {

    }
    
    func setupCellUI(_ cell: MyPostsCellProtocol, index: Int) {
        cell.setupUI(localizer: localizer)
    }
    
    func didTappedCell(with index: Int) {
        
    }
}
