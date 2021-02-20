//
//  MoreMenuPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

class MoreMenuPresenter: MoreMenuPresenterProtocol {
    
    weak var view: MoreMenuViewProtocol?
    var localizer = MoreMenuLocalizer()
    var images = MoreMenuImages()
    var datasource = [MoreMenuUIModel]()
    
    init(view: MoreMenuViewProtocol) {
        self.view = view
    }
    
    func attach() {
        prepareDatasource()
    }
    
    func prepareDatasource() {
        datasource += [.profile(MoreMenuProfileModel())]
        datasource += [.tasks(MoreMenuModel())]
        
        view?.notifiyDataChange()
    }
    
    func handleCellDidTapped(index: Int) {
        let model = datasource[index]
        view?.naviageteTo(model: model)
    }

}
