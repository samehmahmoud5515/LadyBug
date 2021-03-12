//
//  CropsInfoCell.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import UIKit

class CropsInfoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        descLabel.font = UIFont.get(enFont: .light(9), arFont: .light(9))
        titleLabel.textColor = .purplishBrown
        descLabel.textColor = .purplishBrown
    }
}
