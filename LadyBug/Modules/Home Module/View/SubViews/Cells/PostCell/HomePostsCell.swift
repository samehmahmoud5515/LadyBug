//
//  HomeCell.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import UIKit

class HomePostsCell: UITableViewCell {

    @IBOutlet weak var postImageAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var beAFollowerButton: UIButton!
    @IBOutlet weak var postOwnerNameLabel: UILabel!
    @IBOutlet weak var postOwnerJobLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var openProblemButton: UIButton!
    
    @IBOutlet weak var postDescLabel: UILabel!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    func setupUI(localizer: HomeLocalizer) {
        beAFollowerButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        postOwnerNameLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        postOwnerJobLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        timeLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        openProblemButton.titleLabel?.font = UIFont.get(enFont: .light(12), arFont: .light(12))
        postDescLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        openProblemButton.roundCorners([.topRight, .bottomRight], radius: 5)
        openProblemButton.layer.masksToBounds = true
        if let myImage = self.postImageView.image {
            postImageAspectRatioConstraint.constant = myImage.size.width / myImage.size.height
            layoutIfNeeded()
        }
        
    }
    
}
