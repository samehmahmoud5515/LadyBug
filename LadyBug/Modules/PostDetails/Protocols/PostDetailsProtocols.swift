//
//  PostDetailsProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Foundation

protocol PostDetailsPresenterProtocol {
    var images: PostDetailsImages { get }
    var localizer: PostDetailsLocalizer { get }
    func attach() 
}

protocol PostDetailsViewProtocol: class {
    
}
