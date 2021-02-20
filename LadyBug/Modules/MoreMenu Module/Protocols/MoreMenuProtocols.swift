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
    func attach()
}

protocol MoreMenuViewProtocol: class {
    
}
