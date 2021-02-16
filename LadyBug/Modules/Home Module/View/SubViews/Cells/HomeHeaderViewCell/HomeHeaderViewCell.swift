//
//  HomeHeaderViewCell.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import UIKit

class HomeHeaderViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupUI(model: HeaderViewUIModel) {
        titleLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        titleLabel.text = model.title
        logoImageView.image = UIImage(named: model.image)
    }
}
