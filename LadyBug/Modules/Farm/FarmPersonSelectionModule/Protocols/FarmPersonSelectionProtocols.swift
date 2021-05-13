//
//  FollowersProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation
protocol FarmPersonSelectionPresenterProtocols {
    var localizer: FarmPersonSelectionLocalizer { get }
    var images: FarmPersonSelectionImage { get }
    func attach()
    func getFarmPersonSelectionCount() -> Int
}
protocol FarmPersonSelectionViewProtocol : class {
    
}
