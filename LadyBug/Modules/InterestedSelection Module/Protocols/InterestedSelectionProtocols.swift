//
//  InterestedSelectionProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

import Foundation

protocol InterestedSelectionPresenterProtocol {
    var images: InterestedSelectionImages { get }
    var localizer: InterestedSelectionLocalizer { get }
    var datasource: [InterestedSelectionUIModel] { get }
    func attach()
}

protocol InterestedSelectionViewProtocol {
    
}
