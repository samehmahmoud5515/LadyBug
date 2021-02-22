//
//  InterestedSelectionPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

class InterestedSelectionPresenter: InterestedSelectionPresenterProtocol {
    
    var images = InterestedSelectionImages()
    
    var localizer = InterestedSelectionLocalizer()
    
    var datasource: [InterestedSelectionUIModel] = []
    
    init(view: InterestedSelectionViewProtocol) {
        
    }
    
    func attach() {
        prepareDatasource()
    }
    
    private func prepareDatasource() {
         
    }
}
