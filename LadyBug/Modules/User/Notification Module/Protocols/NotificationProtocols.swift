//
//  NotificationProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/24/21.
//

import Foundation
    
    protocol NotificationPresenterProtocol {
        var localizer: NotificationLocalizer { get }
        var images: NotificationImages { get }
        var notifications : [Notification] {get}
        func attach()
        func getNotification()
        func readNotification(notificationId : String )
        func unreadNotification(notificationId : String )
    }
    protocol NotificationViewProtocol: class {
        
        func reloadData()
        
    }
