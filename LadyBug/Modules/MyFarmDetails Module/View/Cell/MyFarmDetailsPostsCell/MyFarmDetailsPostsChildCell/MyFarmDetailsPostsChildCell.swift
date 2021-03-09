//
//  MyFarmDetailsPostsChildCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsPostsChildCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func setupUI() {
        titleLabel.textColor = .purplishBrown
        descLabel.textColor = .purplishBrown
        
        titleLabel.font = UIFont.get(enFont: .regular(8), arFont: .regular(8))
        descLabel.font = UIFont.get(enFont: .light(7), arFont: .light(7))
    }
}
