//
//  FarmTypeCell.swift
//  LadyBug
//
//  Created by SAMEH on 25/03/2021.
//

import UIKit

protocol CreateFarmTypeCell {
    func setupUI(isSelected: Bool)
}

class FarmTypeCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    @IBOutlet weak var hintButton: UIButton!

    func setupUI(isSelected: Bool) {
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        
        
        if isSelected {
            selectionButton.backgroundColor = .midGreenTwo
            selectionButton.setImage(UIImage(named: "tick1"), for: .normal)
            selectionButton.tintColor = .white
        } else {
            selectionButton.layer.borderWidth = 1
            selectionButton.layer.borderColor = UIColor.midGreenTwo.cgColor
            selectionButton.layer.masksToBounds = true
            selectionButton.setImage(nil, for: .normal)
        }
    }
}
