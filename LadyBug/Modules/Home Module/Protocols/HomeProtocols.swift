//
//  HomeProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import Foundation

protocol HomePresenterProtocol: HomeHeaderDelegate {
    func attach()
}

protocol HomeHeaderViewProtocol: class {
    func notifyDatasourceChanged()
}

protocol HomeHeaderDelegate: class {
    var headerDatasource: [String] { get }
    var numberOfSectionsInHeader: Int { get }
}

protocol HomeViewProtocol: class {
    
}
