//
//  MoreMenuPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Moya

class MoreMenuPresenter: MoreMenuPresenterProtocol{
    
    weak var view: MoreMenuViewProtocol?
    var localizer = MoreMenuLocalizer()
    var images = MoreMenuImages()
    var datasource = [MoreMenuUIModel]()
    var user = JObsUserInfo()
    let logoutProvider = MoyaProvider<LogoutEndpoint>(plugins: [AuthorizableTokenPlugin()])
    let profileProvider = MoyaProvider<GetProfileEndPoint>(plugins: [AuthorizableTokenPlugin()])
    let jobsProvider = MoyaProvider<JobsEndPoint>()
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
    
    func logout() {
        logoutProvider.request(.logout) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                AccessTokenManager.removeAccessToken()
                self.view?.stopIndicator()
                self?.view?.navigateToLogin()
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
    func getProfile() {
        profileProvider.request(.getProfile) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let getProfileResponed = try? moyaResponse.map(ProfileResponed.self)
                    guard let getGetProfile = getProfileResponed?.data else { return }
                    self.user = getGetProfile
                    self.view?.notifiyDataChange()
                    self.fetchJobs()
                    self.view?.stopIndicator()
                } catch {
                    self.view?.stopIndicator()
                    print("Parsing Error")
                }
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
    func fetchJobs() {
        jobsProvider.request(.jobs) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let jobsResponse = try? moyaResponse.map(JobsResponse.self)
                    guard let jobs = jobsResponse?.data?.all else { return }
                    self.view?.updateJobName(jobName: jobs.first(where: { $0.id == self.user.humanJobID })?.name ?? "")
                    self.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                    self.view?.stopIndicator()
                }
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
}
