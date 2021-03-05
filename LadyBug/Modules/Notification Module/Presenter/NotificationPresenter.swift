//
//  NotificationPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/24/21.
//

import Foundation

class NotificationPresenter: NotificationPresenterProtocol {
    var localizer = NotificationLocalizer()
    var images = NotificationImages()
    weak var view: NotificationViewProtocol?
    init(view: NotificationViewProtocol) {
        self.view = view
    }
    func attach() {
    }
    func getNotificationCount() -> Int {
         return 10
    }
}
