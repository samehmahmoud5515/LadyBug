//
//  VideosProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

protocol MyPostsPresenterProtocol {
    var localizer: MyPostsLocalizer { get }
    var images: MyPostsImages { get }
    var myPosts: [UserPost] {get set }
    func attach()
    func setupCellUI(_ cell: MyPostsCellProtocol, index: Int)
    func didTappedCell(with index: Int)
    func getUserPosts()
    func setLike( postId : Int, completion: @escaping () -> () )
    func setDisLike( postId : Int, completion: @escaping () -> ()  )
}

protocol MyPostsViewProtocol: class {
    func stopIndicator()
    func reloadData()
}

protocol MyPostsCellProtocol {
    func setupUI(localizer: MyPostsLocalizer , postData: UserPost )
}

protocol MyPostsCellDelegate: class {
    func likeButtonDidTapped(_ cell: MyPostsCell)
    func dislikeButtonDidTapped(_ cell: MyPostsCell)
    func shareButtonDidTapped(_ cell: MyPostsCell)
    func playButtonDidTapped(_ cell: MyPostsCell)
    func openProblemButtonDidTapped(_ cell: MyPostsCell)
}
