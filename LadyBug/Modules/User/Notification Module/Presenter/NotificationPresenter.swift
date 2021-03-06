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
    let provider = MoyaProvider<NotificationEndpoint>(plugins: [AuthorizableTokenPlugin()])
    var notifications = [Notification] ()
    weak var view: NotificationViewProtocol?

    init(view: NotificationViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    
    
    func getNotification() {
        provider.request(.getUserNotifications) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let getNotificationResponse = try? moyaResponse.map(NotificationResponse.self)
                    guard let getNotification = getNotificationResponse?.data?.all else { return }
                    self.notifications = getNotification
                    self.view?.reloadData()
                    self.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
    
    func unreadNotification(notificationId : String ) {
        provider.request(.unreadNotification(notificationId: notificationId)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let unreadNotificationResponse = try? moyaResponse.map(NotificationResponse.self)
                    print(unreadNotificationResponse)
                    guard let unreadNotification = unreadNotificationResponse?.data else { return }
                    print(unreadNotification)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
    
    func readNotification(notificationId : String ) {
        provider.request(.readNotification(notificationId: notificationId)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let readNotificationResponse = try? moyaResponse.map(NotificationResponse.self)
                    print(readNotificationResponse)
                    guard let readNotification = readNotificationResponse?.data else { return }
                    print(readNotification)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
}
