//
//  CropsInfoHeaderViewCell.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import UIKit

class CropsInfoHeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    
    func setupUI(isSelected: Bool) {
        titleLabel.textColor = .purplishBrownTwo
        titleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        selectionView.backgroundColor = isSelected ? .midGreenTwo : .clear
    }

}
