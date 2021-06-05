//
//  PostDetailsProtocols.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Foundation

protocol PostDetailsPresenterProtocol {
    var images: PostDetailsImages { get }
    var localizer: PostDetailsLocalizer { get }
    func attach()
    var commentImage: MediaUpload?{get set}
    var post : UserPost {get set}
    func setLike( postId : Int, completion: @escaping () -> () )
    func setDisLike( postId : Int, completion: @escaping () -> () )
    func setCommentLike( commentId : Int ,   completion: @escaping () -> () )
    func setCommentDisLike( commentId : Int , completion: @escaping () -> ()  )
    func solvePost(postId : Int)
    func createComment(content: String, postId: Int)

}

protocol PostDetailsViewProtocol: class {
    
}

protocol PostDetailsDelegate: class {
    func likeButtonDidTapped(_ cell: PostDetailsCell)
    func dislikeButtonDidTapped(_ cell: PostDetailsCell)
    func shareButtonDidTapped(_ cell: PostDetailsCell)
    func playButtonDidTapped(_ cell: PostDetailsCell)
    func openProblemButtonDidTapped(_ cell: PostDetailsCell)
    func postOwnerDidTapped(_ cell: PostDetailsCell)
}

protocol PostDetailsCommentDelegate: class {
    func likeButtonDidTapped(_ cell: CommentCell)
    func dislikeButtonDidTapped(_ cell: CommentCell)
}

