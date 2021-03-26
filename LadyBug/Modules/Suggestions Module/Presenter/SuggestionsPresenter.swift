//
//  SuggestionsPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/25/21.
//

import Foundation
class SuggestionsPresenter: SuggestionsPresenterProtocol {
    
    
    weak var view: SuggestionsViewProtocol?
    var localizer = SuggestionsLocalizer()
    var images = SuggestionsImages()
    var datasource = [SuggestionsModel]()
    init(view: SuggestionsViewProtocol) {
        self.view = view
    }
    
    func attach() {
        prepareDatasource() 
    }
    
    func getSuggestionsCount() -> Int {
        return 4
    }
    func prepareDatasource() {
        
        let waterMelon = SuggestionsModel()
        waterMelon.image = images.waterMelon
        waterMelon.title = localizer.waterMelon
        datasource += [waterMelon]
        
        let lemon = SuggestionsModel()
        waterMelon.image = images.lemon
        waterMelon.title = localizer.lemonLabel
        datasource += [lemon]
        
        let orange = SuggestionsModel()
        waterMelon.image = images.orange
        waterMelon.title = localizer.orange
        datasource += [orange]
        
        let apple = SuggestionsModel()
        waterMelon.image = images.apple
        waterMelon.title = localizer.apple
        datasource += [apple]
    }
}
