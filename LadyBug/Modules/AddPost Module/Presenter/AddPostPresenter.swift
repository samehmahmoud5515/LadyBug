//
//  AddPostPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import Foundation

class AddPostPresenter: AddPostPresenterProtocol {
    weak var view: AddPostViewProtocol?
    
    var images = AddPostImages()
    var localizer = AddPostLocalizer()
    
    var datasource = [AddPostUIModel]()
    
    init(view: AddPostViewProtocol) {
        self.view = view
    }
    
    func attach() {
        setupDataSource()
    }
    
    private func setupDataSource() {
        datasource += [.postType(AddPostModel(title: localizer.questionType, selectionTitle: localizer.problemDisplay))]
        datasource += [.cropType(AddPostModel(title: localizer.cropTitle, selectionTitle: localizer.selectFarm))]
    }
    
    func getItemFor(index: Int) -> AddPostUIModel {
        return datasource[index]
    }
}
