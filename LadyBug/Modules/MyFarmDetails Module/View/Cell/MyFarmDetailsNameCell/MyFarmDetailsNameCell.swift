//
//  MyFarmDetailsNameCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsNameCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        titleLabel.textColor = .purplishBrown
        
        typeLabel.font = UIFont.get(enFont: .light(9), arFont: .light(9))
        typeLabel.textColor = .midGreenTwo
    }
}
