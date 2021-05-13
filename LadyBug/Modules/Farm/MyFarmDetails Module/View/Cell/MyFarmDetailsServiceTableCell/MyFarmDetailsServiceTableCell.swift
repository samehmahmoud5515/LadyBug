//
//  MyFarmDetailsServiceTableCell.swift
//  LadyBug
//
//  Created by SAMEH on 06/03/2021.
//

import UIKit

class MyFarmDetailsServiceTableCell: UITableViewCell {
    
    @IBOutlet weak var addTitleLabel: UILabel!
    @IBOutlet weak var addTitleButton: UIButton!
    
    func setupUI() {
        addTitleLabel.textColor = .purplishBrown
        addTitleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
    }
}
