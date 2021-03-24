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
    var images: HomeImages { get }
    func attach()
    func setupCellUI(_ cell: HomePostsCellProtocol, index: Int)
    func didTappedCell(with index: Int)
}

protocol HomeHeaderDelegate: class {
    var headerDatasource: [HeaderViewUIModel] { get }
    var numberOfSectionsInHeader: Int { get }
}

protocol HomeViewProtocol: class {
    func notifyHeaderViewDatasourceChanged()
    func navigateToPostDetails()
}

protocol HomePostsCellProtocol {
    func setupUI(localizer: HomeLocalizer)
}

protocol HomePostsCellDelegate: class {
    func likeButtonDidTapped(_ cell: HomePostsCell)
    func dislikeButtonDidTapped(_ cell: HomePostsCell)
    func shareButtonDidTapped(_ cell: HomePostsCell)
    func playButtonDidTapped(_ cell: HomePostsCell)
    func openProblemButtonDidTapped(_ cell: HomePostsCell)
    func postOwnerDidTapped(_ cell: HomePostsCell)
}
