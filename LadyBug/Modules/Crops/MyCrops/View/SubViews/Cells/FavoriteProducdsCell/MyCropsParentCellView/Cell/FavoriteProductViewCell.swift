//
//  MyCropsCell.swift
//  LadyBug
//
//  Created by SAMEH on 04/03/2021.
//

import UIKit

class FavoriteProductViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    func setupUI() {
        titleLabel.textColor = .purplishBrown
        descLabel.textColor = .purplishBrown
        
        titleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        descLabel.font = UIFont.get(enFont: .light(8), arFont: .light(8))
    }
}
