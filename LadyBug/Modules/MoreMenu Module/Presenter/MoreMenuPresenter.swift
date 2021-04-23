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
        let profileModel = MoreMenuProfileModel(profileImage: images.profilePicture, name: localizer.userName, job: localizer.occupation, mobileNumber: localizer.phoneNumber, editTitle: localizer.edit, numberOfPointsImage: images.bestSellerPoints, numberOfPointsTitle: localizer.points, pointsValue: localizer.pointNumber)
        datasource += [.profile(profileModel)]
        
        let notificationModel = MoreMenuNotificationModel()
        notificationModel.isNotificationOn = true
        notificationModel.image = images.notifications
        notificationModel.title = localizer.notifications
        datasource += [.notification(notificationModel)]
        
        let tasksModel = MoreMenuModel()
        tasksModel.image = images.tasksToday
        tasksModel.title = localizer.tasksToday
        datasource += [.tasks(tasksModel)]
        
        let productsModel = MoreMenuModel()
        productsModel.image = images.products
        productsModel.title = localizer.products
        datasource += [.products(productsModel)]
        
        let postsModel = MoreMenuModel()
        postsModel.image = images.posts
        postsModel.title = localizer.posts
        datasource += [.posts(postsModel)]
        
        let followersModel = MoreMenuModel()
        followersModel.image = images.followers
        followersModel.title = localizer.followers
        datasource += [.followers(followersModel)]
        
        let interestsModel = MoreMenuModel()
        interestsModel.image = images.Interests
        interestsModel.title = localizer.interests
        datasource += [.interests(interestsModel)]
        
        let usageAgreementsModel = MoreMenuModel()
        usageAgreementsModel.image = images.usageAgreement
        usageAgreementsModel.title = localizer.usageAgreement
        datasource += [.usageAgreement(usageAgreementsModel)]
        
        let languageModel = MoreMenuLanguageModel()
        languageModel.image = images.language
        languageModel.title = localizer.language
        languageModel.language = localizer.arbic
        datasource += [.language(languageModel)]
        
        let helpModel = MoreMenuModel()
        helpModel.image = images.help
        helpModel.title = localizer.help
        datasource += [.help(helpModel)]
        
        let logOutModel = MoreMenuModel()
        logOutModel.image = images.logout
        logOutModel.title = localizer.logout
        datasource += [.logOut(logOutModel)]
        view?.notifiyDataChange()
    }
    
    func handleCellDidTapped(index: Int) {
        let model = datasource[index]
        switch model {
        case .logOut:
            logout()
        default:
            view?.naviageteTo(model: model)
        }
    }
    
    private func logout() {
       // AccessTokenManager.removeAccessToken()
        view?.naviageteTo(model: MoreMenuUIModel.logOut(MoreMenuModel()))
    }
}
