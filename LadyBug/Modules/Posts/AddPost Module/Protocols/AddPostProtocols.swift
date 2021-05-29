//
//  AddPostProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import Foundation

protocol AddPostPresenterProtocol {
    
    var images: AddPostImages { get }
    var localizer: AddPostLocalizer { get }
    var datasource: [AddPostUIModel] { get }
   

    func attach()
    func getItemFor(index: Int) -> AddPostUIModel
    
}

protocol AddPostViewProtocol: class {
    func notifyDataChange()
}
