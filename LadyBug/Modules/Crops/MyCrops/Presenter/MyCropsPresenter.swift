//
//  MyCropsPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 24/02/2021.
//

import Foundation

class MyCropsPresenter: MyCropsPresenterProtocol {
    
    weak var view: MyCropsViewProtocol?
    var images = MyCropsImages()
    var localizer = MyCropsLocalizer()
    var headerDatasource: [MyCropsHeaderViewUIModel] = []
    var cropsDatasource: [MyCropsUIModel] = []
    
    init(view: MyCropsViewProtocol) {
        self.view = view
    }
    
    func attach() {
        prepareHeaderDatasource()
        prepareCropsDatasource()
    }
    
    private func prepareHeaderDatasource() {
        headerDatasource = [.edit, .crops([MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel(), MyCropsHeaderViewModel()])]
        view?.notifiyHeaderViewDatasourceDidUpdated()
    }
    
    func didTapItemInHeaderView(cell: MyCropsHeaderViewCropCellProtocol, index: Int) {
        guard var datasource = headerDatasource.first(where: { $0 != .edit })?.crops else { return }
        var item = datasource[index]
        item.isSelected = !item.isSelected
        datasource[index] = item
        headerDatasource = [.edit, .crops(datasource), .crops(datasource)]
        cell.setupUI(with: item)
    }
    
    private func prepareCropsDatasource() {
        cropsDatasource = [.crops, .products, .products]
        view?.notifiyViewDatasourceDidUpdated()
    }
}
