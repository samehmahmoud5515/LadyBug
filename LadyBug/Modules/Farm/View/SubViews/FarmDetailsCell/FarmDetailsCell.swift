//
//  FarmDetailsCell.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import UIKit

class FarmDetailsCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateUI(_ title: String, value: String) {
        titleLabel.text = title
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        detailsLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
//        titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
//        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//        return layoutAttributes
//    }
}
