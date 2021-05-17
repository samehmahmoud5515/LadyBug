//
//  MyFarmDetailsPeopleChildCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit
import SDWebImage

class MyFarmDetailsPeopleChildCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!

    func setupUI(user: User) {
        nameLabel.text = user.name
        jobTitleLabel.text = user.jobName
        logoImageView.sd_setImage(with: URL(string: user.photoURL ?? ""), completed: nil)
        
        nameLabel.textColor = .purplishBrown
        jobTitleLabel.textColor = .blueGrey
        
        nameLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        jobTitleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
    }
}
