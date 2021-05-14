//
//  FollowersProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation
protocol FollowersPresenterProtocols {
    var localizer: FollowersLocalizer { get }
    var images: FollowersImage { get }
    var user : [User]{get}
    func attach()
    func getUserFollowers()
    func getUserFollowings()
    func toggleFollow(userId : Int )
    
}
protocol FollowersViewProtocol : class {
    func reloadData()
}
