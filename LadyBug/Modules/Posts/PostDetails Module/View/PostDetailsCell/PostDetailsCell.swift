//
//  PostDetailsCell.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class PostDetailsCell: UITableViewCell {

    @IBOutlet weak var postImageAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var postOwnerNameLabel: UILabel!
    @IBOutlet weak var postOwnerJobLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var postOwnerImage: UIImageView!
    weak var delegate: PostDetailsDelegate?

    func setupUI(localizer: HomeLocalizer , postData: UserPost ){
        setupUI()
               postOwnerImage.sd_setImage(with: URL(string: postData.author?.photoURL ?? ""))
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
        optionsButton.titleLabel?.font = UIFont.get(enFont: .light(12), arFont: .light(12))
        postDescLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        optionsButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        optionsButton.layer.cornerRadius = 5
        optionsButton.layer.masksToBounds = true
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
    
    @IBAction func postOwnerDidTapped(_ sender: Any) {
       delegate?.postOwnerDidTapped(self)
    }
}
