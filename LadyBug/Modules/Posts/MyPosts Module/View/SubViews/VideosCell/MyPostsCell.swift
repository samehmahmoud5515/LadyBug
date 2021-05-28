//
//  MyPostsCell.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class MyPostsCell: UITableViewCell, MyPostsCellProtocol {
    
    @IBOutlet weak var postImageAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var postOwnerNameLabel: UILabel!
    @IBOutlet weak var PostOwnerImage: UIImageView!
    @IBOutlet weak var postOwnerJobLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var openProblemButton: UIButton!
    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    weak var delegate: MyPostsCellDelegate?
    
    func setupUI(localizer: MyPostsLocalizer , postData: UserPost )
    {
        setupUI()
        PostOwnerImage.sd_setImage(with: URL(string: postData.author?.photoURL ?? ""))
        postOwnerNameLabel.text = postData.author?.name
        postOwnerJobLabel.text = postData.author?.jobName
        timeLabel.text = postData.createdAt
        postDescLabel.text = postData.content
        if let image = postData.imageAssets{
            postImageView.sd_setImage(with: URL(string: image.first ?? "" ))
            playButton.setBackgroundImage( nil , for: .normal)
        } else {
            playButton.setBackgroundImage( nil , for: .normal)
        }
        if postData.videoAssets == []
        {
            playButton.setBackgroundImage( nil , for: .normal)
        }
        setColorForButton(postData: postData)
    }
    func setupUI(){
        
        postOwnerNameLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        postOwnerJobLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        timeLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        openProblemButton.titleLabel?.font = UIFont.get(enFont: .light(12), arFont: .light(12))
        postDescLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        openProblemButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        openProblemButton.layer.cornerRadius = 5
        openProblemButton.layer.masksToBounds = true
        if let myImage = self.postImageView.image {
            postImageAspectRatioConstraint.constant = myImage.size.width / myImage.size.height
            layoutIfNeeded()
        }
        likeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        dislikeButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    
    func setColorForButton(postData: UserPost){
        
        if postData.likedByMe == true  {
            likeButton.setImage(UIImage(named: CommonImages.like), for: .normal)
            likeButton.setTitleColor( UIColor.midGreenTwo, for: .normal)
        }
        
        if postData.dislikedByMe == true{
            dislikeButton.setImage(UIImage(named: CommonImages.dislikeRed), for: .normal)
            dislikeButton.setTitleColor( UIColor.tomatoRed, for: .normal)
        }
        
        if postData.likedByMe == false {
            likeButton.setImage(UIImage(named: CommonImages.likeGrey), for: .normal)
            likeButton.setTitleColor(UIColor.blueyGrey, for: .normal)
        }
        
        if postData.dislikedByMe == false {
            dislikeButton.setImage(UIImage(named: CommonImages.dislike), for: .normal)
            dislikeButton.setTitleColor(UIColor.blueyGrey, for: .normal)
        }
    }
    
    @IBAction func likeButtonDidTapped(_ sender: Any) {
        delegate?.likeButtonDidTapped(self)
    }
    
    @IBAction func dislikeButtonDidTapped(_ sender: Any) {
        delegate?.dislikeButtonDidTapped(self)
    }
    
    @IBAction func shareButtonDidTapped(_ sender: Any) {
        delegate?.shareButtonDidTapped(self)
    }
    
    @IBAction func playButtonDidTapped(_ sender: Any) {
        delegate?.playButtonDidTapped(self)
    }
    
    @IBAction func openProblemButtonDidTapped(_ sender: Any) {
        delegate?.openProblemButtonDidTapped(self)
    }
    
}
