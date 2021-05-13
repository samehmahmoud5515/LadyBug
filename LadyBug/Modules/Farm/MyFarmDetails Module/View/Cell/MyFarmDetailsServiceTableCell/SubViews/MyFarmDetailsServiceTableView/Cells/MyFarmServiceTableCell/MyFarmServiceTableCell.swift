//
//  MyFarmServiceTableCell.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class MyFarmServiceTableCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    
    func setupUI(isSelected: Bool) {
        titleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
        titleLabel.textColor = isSelected ? .purplishBrown : .cloudyBlueTwo
        selectionView.backgroundColor = isSelected ? .midGreen : .paleGreyFive
    }
}
