//
//  HelpPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/19/21.
//

import Foundation
class HelpPresenter: HelpPresenterProtocol{
    var localizer = HelpLocalizer()
    var image =  HelpImages()
    
    weak var view : HelpviewProtocol?
   
    init(view : HelpviewProtocol ){
        self.view = view
    }
    func attach() {
           
       }
    
    
    
    
}
