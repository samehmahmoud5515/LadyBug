//
//  VideosProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

protocol MyPostsPresenterProtocol {
    var postsDatasource: [String] { get }
    var localizer: MyPostsLocalizer { get }
    var images: MyPostsImages { get }
    var myPosts: [Post] {get}
    func attach()
    func setupCellUI(_ cell: MyPostsCellProtocol, index: Int)
    func didTappedCell(with index: Int)
    func getUserPosts()
}

protocol MyPostsViewProtocol: class {
    func stopIndicator()
    func reloadData()
}

protocol MyPostsCellProtocol {
    func setupUI(localizer: MyPostsLocalizer)
}

protocol MyPostsCellDelegate: class {
    func likeButtonDidTapped(_ cell: MyPostsCell)
    func dislikeButtonDidTapped(_ cell: MyPostsCell)
    func shareButtonDidTapped(_ cell: MyPostsCell)
    func playButtonDidTapped(_ cell: MyPostsCell)
    func openProblemButtonDidTapped(_ cell: MyPostsCell)
}
