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
    
    weak var view: InterestedSelectionViewProtocol?
    
    init(view: InterestedSelectionViewProtocol) {
        self.view = view
    }
    
    func attach() {
        prepareDatasource()
    }
    
    private func prepareDatasource() {
        datasource += [InterestedSelectionUIModel(title: localizer.header1, data: [CropUIModel(), CropUIModel(), CropUIModel()])]
        datasource += [InterestedSelectionUIModel(title: localizer.header2, data: [CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel()])]
        datasource += [InterestedSelectionUIModel(title: localizer.header3, data: [CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel(), CropUIModel()])]
        view?.notifyDatasourceChanged()
    }
    
    func didSelectItemAt(row: Int, section: Int, cell: InterestedSelectionCellProtocol) {
        datasource[section].data[row].toggleSelection()
        
        cell.setupUI(model: datasource[section].data[row])
    }

}
