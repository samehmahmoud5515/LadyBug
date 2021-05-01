//
//  NotificationPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/24/21.
//

import Moya

class NotificationPresenter: NotificationPresenterProtocol {
  
    var localizer = NotificationLocalizer()
    var images = NotificationImages()
    let providerUnreadNotification = MoyaProvider<UnreadNotificationEndpoint>(plugins: [AuthorizableTokenPlugin()])
    let providerGetNotification = MoyaProvider<GetUserNotificationsEndpoint>(plugins: [AuthorizableTokenPlugin()])
    let providerReadNotification = MoyaProvider<ReadNotificationEndpoint>(plugins: [AuthorizableTokenPlugin()])

    weak var view: NotificationViewProtocol?
    init(view: NotificationViewProtocol) {
        self.view = view
    }
    func attach() {
    }
    func getNotificationCount() -> Int {
         return 10
    }
    func unreadNotification() {
        providerUnreadNotification.request(.unreadNotification) { result in
                   switch result {
                   case let .success(moyaResponse):
                       do {
                           let registrationResponse = try? moyaResponse.map(UpdateResponse.self)
                           print(registrationResponse)
                           guard let accessToken = registrationResponse?.data?.accessToken else { return }
                           AccessTokenManager.saveAccessToken(token: accessToken)
                       } catch {
                           print("Parsing Error")
                       }
                   case let .failure(error):
                       break
                   }
               }
    }
    
    func getUserNotifications() {
        providerUnreadNotification.request(.unreadNotification) { result in
                   switch result {
                   case let .success(moyaResponse):
                       do {
                           let registrationResponse = try? moyaResponse.map(UpdateResponse.self)
                           print(registrationResponse)
                           guard let accessToken = registrationResponse?.data?.accessToken else { return }
                           AccessTokenManager.saveAccessToken(token: accessToken)
                       } catch {
                           print("Parsing Error")
                       }
                   case let .failure(error):
                       break
                   }
               }
    }
    
    func readNotification() {
               providerReadNotification.request(.readNotification) { result in
                   switch result {
                   case let .success(moyaResponse):
                       do {
                           let registrationResponse = try? moyaResponse.map(UpdateResponse.self)
                           print(registrationResponse)
                           guard let accessToken = registrationResponse?.data?.accessToken else { return }
                           AccessTokenManager.saveAccessToken(token: accessToken)
                       } catch {
                           print("Parsing Error")
                       }
                   case let .failure(error):
                       break
                   }
               }
           }
}
