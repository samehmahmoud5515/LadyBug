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
    func attach()
    func getFollowersCount() -> Int
}
protocol FollowersViewProtocol : class {
    
}
