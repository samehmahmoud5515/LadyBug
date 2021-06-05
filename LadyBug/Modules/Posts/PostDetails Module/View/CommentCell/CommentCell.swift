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
    @IBOutlet weak var ownerCommentImage: UIImageView!
    
    weak var delegate: PostDetailsCommentDelegate?
    
    func updateJobName( jobName : String ){
        commenterJobLabel.text = jobName
    }
    
    func setupUI(comment: PostComment) {
        
        setup()
        if let imageURL = comment.commenter?.photoURL {
        ownerCommentImage.sd_setImage(with: URL(string: imageURL))
        }
        commenterJobLabel.text = comment.commenter?.jobName
        commenterNameLabel.text = comment.commenter?.name
        commentLabel.text = comment.content
        timeLabel.text = comment.createdAt
        setColorForButton(comment: comment)
    }
    
    func setup(){
        
        commenterNameLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        commenterJobLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        timeLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        commentLabel.font = UIFont.get(enFont: .light(12), arFont: .light(12))
        likeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        dislikeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        commenterNameLabel.textColor = .black
        commenterJobLabel.textColor = .blueyGrey
        timeLabel.textColor = .blueyGrey
        commentLabel.textColor = .black
        
    }
    
    func setColorForButton(comment: PostComment){
        
        if comment.likedByMe == true  {
            likeButton.setImage(UIImage(named: CommonImages.like), for: .normal)
            likeButton.setTitleColor( UIColor.midGreenTwo, for: .normal)
        }
        
        if comment.dislikedByMe == true{
            dislikeButton.setImage(UIImage(named: CommonImages.dislikeRed), for: .normal)
            dislikeButton.setTitleColor( UIColor.tomatoRed, for: .normal)
        }
        
        if comment.likedByMe == false {
            likeButton.setImage(UIImage(named: CommonImages.likeGrey), for: .normal)
            likeButton.setTitleColor(UIColor.blueyGrey, for: .normal)
        }
        
        if comment.dislikedByMe == false {
            dislikeButton.setImage(UIImage(named: CommonImages.dislike), for: .normal)
            dislikeButton.setTitleColor(UIColor.blueyGrey, for: .normal)
        }
    }
    
    @IBAction func likeButtonDidTapped(_ sender: UIButton) {
        delegate?.likeButtonDidTapped( self)
    }
    
    @IBAction func disLikeButtonDidTapped(_ sender: UIButton) {
        delegate?.dislikeButtonDidTapped( self)
    }
}
