//
//  MoreMenuUIModel.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

enum MoreMenuUIModel {
    case profile(MoreMenuProfileModel)
    case notification(MoreMenuNotificationModel)
    case language(MoreMenuLanguageModel)
    case tasks(MoreMenuModel)
    case products(MoreMenuModel)
    case posts(MoreMenuModel)
    case followers(MoreMenuModel)
    case interests(MoreMenuModel)
    case usageAgreement(MoreMenuModel)
    case help(MoreMenuModel)
    case logOut(MoreMenuModel)
}

