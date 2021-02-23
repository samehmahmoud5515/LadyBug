//
//  InterestedSelectionCell.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

import UIKit

protocol InterestedSelectionCellProtocol {
    func setupUI(model: CropUIModel)
}

class InterestedSelectionCell: UICollectionViewCell, InterestedSelectionCellProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var selectionImageView: UIImageView!
    
    func setupUI(model: CropUIModel) {
        selectionImageView.isHidden = !model.isSelected
        titleLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
    }

}
