//
//  FarmDetailsCell.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import UIKit

class FarmDetailsCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    func updateUI(info: FarmUIModel) {
        titleLabel.text = info.title
        detailsLabel.text = info.value
        titleLabel.textColor = .blueGrey
        titleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        detailsLabel.textColor = .midGreenTwo
        detailsLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
    }
}
