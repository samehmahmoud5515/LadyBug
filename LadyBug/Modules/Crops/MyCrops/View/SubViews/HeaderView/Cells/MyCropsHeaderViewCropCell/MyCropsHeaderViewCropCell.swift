//
//  MyCropsHeaderViewCropCell.swift
//  LadyBug
//
//  Created by SAMEH on 02/03/2021.
//

import UIKit

protocol MyCropsHeaderViewCropCellProtocol {
    func setupUI(with model: MyCropsHeaderViewModel)
}

class MyCropsHeaderViewCropCell: UICollectionViewCell {
    @IBOutlet weak var logoContainerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
}

extension MyCropsHeaderViewCropCell: MyCropsHeaderViewCropCellProtocol {
    func setupUI(with model: MyCropsHeaderViewModel) {
        logoContainerView.backgroundColor = model.isSelected ? .lightPeach : .paleGrey
    }
}
