//
//  PostDetailsCell.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class PostDetailsCell: UITableViewCell {

    @IBOutlet weak var postImageAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var beAFollowerButton: UIButton!
    @IBOutlet weak var postOwnerNameLabel: UILabel!
    @IBOutlet weak var postOwnerJobLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    func setupUI(localizer: HomeLocalizer) {
        beAFollowerButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
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
    
    @IBAction func likeButtonDidTapped(_ sender: Any) {
        
    }
    
    @IBAction func dislikeButtonDidTapped(_ sender: Any) {
        
    }
    
    @IBAction func shareButtonDidTapped(_ sender: Any) {
        
    }
    
    @IBAction func playButtonDidTapped(_ sender: Any) {
        
    }
    
    @IBAction func openProblemButtonDidTapped(_ sender: Any) {

    }
    
    @IBAction func postOwnerDidTapped(_ sender: Any) {
       
    }
}
