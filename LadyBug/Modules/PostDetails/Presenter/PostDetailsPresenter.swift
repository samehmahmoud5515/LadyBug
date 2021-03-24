//
//  PostDetailsPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Foundation

class PostDetailsPresenter: PostDetailsPresenterProtocol {
    var images = PostDetailsImages()
    
    var localizer = PostDetailsLocalizer()
    
    weak var view: PostDetailsViewProtocol?
    
    init(view: PostDetailsViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    
}
