//
//  MoreMenuProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

protocol MoreMenuPresenterProtocol {
    var localizer: MoreMenuLocalizer { get }
    var images: MoreMenuImages { get }
    var datasource: [MoreMenuUIModel] { get }
    var user : JObsUserInfo { get }
    func handleCellDidTapped(index: Int)
    func attach()
    func logout()
    func getProfile()
}

protocol MoreMenuViewProtocol: class {
    func notifiyDataChange()
    func naviageteTo(model: MoreMenuUIModel)
    func updateJobName(jobName : String )
    func stopIndicator()
    func navigateToLogin()
}
