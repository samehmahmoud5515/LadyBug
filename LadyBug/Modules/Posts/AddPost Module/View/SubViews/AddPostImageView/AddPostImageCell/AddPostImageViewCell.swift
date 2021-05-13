//
//  AddPostImageCell.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

class AddPostImageViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
    }
}
