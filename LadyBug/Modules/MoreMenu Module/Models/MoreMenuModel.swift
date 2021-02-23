//
//  MoreMenuModel.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

struct  MoreMenuProfileModel {
    var profileImage: String = ""
    var name: String = ""
    var job: String = ""
    var mobileNumber: String = ""
    var editTitle: String = ""
    var numberOfPointsImage: String = ""
    var numberOfPointsTitle: String = ""
    var pointsValue: String = ""
}

class MoreMenuNotificationModel: MoreMenuModel {
    var isNotificationOn: Bool = false
}

class MoreMenuLanguageModel: MoreMenuModel {
    var language = ""
}

class MoreMenuModel {
    var image = ""
    var title = ""
}
