//
//  VideosProtocols.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Foundation

protocol VideosPresenterProtocol {
    var postsDatasource: [String] { get }
    var localizer: VideosLocalizer { get }
    var images: VideosImages { get }
    func attach()
    func setupCellUI(_ cell: VideosCellProtocol, index: Int)
    func didTappedCell(with index: Int)
}

protocol VideosViewProtocol: class {
    func navigateToPostDetails()
}

protocol VideosCellProtocol {
    func setupUI(localizer: VideosLocalizer)
}

protocol VideosCellDelegate: class {
    func likeButtonDidTapped(_ cell: VideosCell)
    func dislikeButtonDidTapped(_ cell: VideosCell)
    func shareButtonDidTapped(_ cell: VideosCell)
    func playButtonDidTapped(_ cell: VideosCell)
    func openProblemButtonDidTapped(_ cell: VideosCell)
}
