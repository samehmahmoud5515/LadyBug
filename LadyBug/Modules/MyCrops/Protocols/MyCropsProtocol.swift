//
//  MyCropsPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 24/02/2021.
//

import Foundation

protocol MyCropsPresenterProtocol: MyCropsHeaderDelegate {
    var images: MyCropsImages { get }
    var localizer: MyCropsLocalizer { get }
    var cropsDatasource: [MyCropsUIModel] { get }
    func attach()
}

protocol MyCropsViewProtocol: class {
    func notifiyHeaderViewDatasourceDidUpdated()
    func notifiyViewDatasourceDidUpdated()
}

protocol MyCropsHeaderDelegate: class {
    var headerDatasource: [MyCropsHeaderViewUIModel] { get }
    func didTapItemInHeaderView(cell: MyCropsHeaderViewCropCellProtocol, index: Int)
}
