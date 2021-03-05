//
//  MyFarmDetailsPeopleChildCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsPeopleChildCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!

    func setupUI() {
        nameLabel.textColor = .purplishBrown
        jobTitleLabel.textColor = .blueGrey
        
        nameLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        jobTitleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
    }
}
