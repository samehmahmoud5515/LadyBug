//
//  InterestedSelectionHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

import UIKit

class InterestedSelectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupUI(with text: String) {
        titleLabel.text = text
        titleLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        titleLabel.textColor = .purplishBrown
    }
}
