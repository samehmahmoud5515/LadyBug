//
//  HomeProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import Foundation

protocol HomePresenterProtocol: HomeHeaderDelegate {
    var postsDatasource: [String] { get }
    var localizer: HomeLocalizer { get }
    func attach()
}

protocol HomeHeaderDelegate: class {
    var headerDatasource: [HeaderViewUIModel] { get }
    var numberOfSectionsInHeader: Int { get }
}

protocol HomeViewProtocol: class {
    func notifyHeaderViewDatasourceChanged()
}
