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
        let profileModel = MoreMenuProfileModel(profileImage: "", name: "", job: "", mobileNumber: "", editTitle: "", editImage: "", numberOfPointsImage: "", numberOfPointsTitle: "", pointsValue: "")
        datasource += [.profile(MoreMenuProfileModel())]
        
        let notificationModel = MoreMenuNotificationModel()
        notificationModel.isNotificationOn = false
        notificationModel.image = ""
        notificationModel.title = ""
        datasource += [.notification(MoreMenuNotificationModel())]
        
        let tasksModel = MoreMenuModel()
        tasksModel.image = ""
        tasksModel.title = ""
        datasource += [.tasks(MoreMenuModel())]
        
        let productsModel = MoreMenuModel()
        productsModel.image = ""
        productsModel.title = ""
        datasource += [.products(MoreMenuModel())]
        
        let postsModel = MoreMenuModel()
        postsModel.image = ""
        postsModel.title = ""
        datasource += [.posts(MoreMenuModel())]
        
        let followersModel = MoreMenuModel()
        followersModel.image = ""
        followersModel.title = ""
        datasource += [.followers(MoreMenuModel())]
        
        let interestsModel = MoreMenuModel()
        interestsModel.image = ""
        interestsModel.title = ""
        datasource += [.interests(MoreMenuModel())]
        
        let usageAgreementsModel = MoreMenuModel()
        usageAgreementsModel.image = ""
        usageAgreementsModel.title = ""
        datasource += [.usageAgreement(MoreMenuModel())]
        
        let languageModel = MoreMenuModel()
        languageModel.image = ""
        languageModel.title = ""
        languageModel.image = ""
        datasource += [.language(MoreMenuLanguageModel())]
        
        let helpModel = MoreMenuModel()
        helpModel.image = ""
        helpModel.title = ""
        datasource += [.help(MoreMenuModel())]
        
        let logOutModel = MoreMenuModel()
        logOutModel.image = ""
        logOutModel.title = ""
        datasource += [.logOut(MoreMenuModel())]
        view?.notifiyDataChange()
    }
    
    func handleCellDidTapped(index: Int) {
        let model = datasource[index]
        view?.naviageteTo(model: model)
    }
    
}
