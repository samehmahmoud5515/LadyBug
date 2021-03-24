//
//  ChemicalSourceCell.swift
//  LadyBug
//
//  Created by SAMEH on 25/03/2021.
//

import UIKit

class ChemicalSourceCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        titleLabel.textColor = .white
    }
}
