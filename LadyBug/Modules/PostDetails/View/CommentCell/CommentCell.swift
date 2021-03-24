//
//  CommentCell.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var commenterNameLabel: UILabel!
    @IBOutlet weak var commenterJobLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    func setupUI() {
        commenterNameLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        commenterJobLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        timeLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        commentLabel.font = UIFont.get(enFont: .light(12), arFont: .light(12))

//        if let myImage = self.postImageView.image {
//            postImageAspectRatioConstraint.constant = myImage.size.width / myImage.size.height
//            layoutIfNeeded()
//        }
        likeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        dislikeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        commenterNameLabel.textColor = .black
        commenterJobLabel.textColor = .blueyGrey
        timeLabel.textColor = .blueyGrey
        commentLabel.textColor = .black
    }
}
