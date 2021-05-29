//
//  MyCropsStretchedCell.swift
//  LadyBug
//
//  Created by SAMEH on 02/03/2021.
//

import UIKit

class MyCropsNewsViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    func setupUI() {
        titleLabel.textColor = .purplishBrown
        descLabel.textColor = .purplishBrown
        
        titleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        descLabel.font = UIFont.get(enFont: .light(12), arFont: .light(12))
    }
}
