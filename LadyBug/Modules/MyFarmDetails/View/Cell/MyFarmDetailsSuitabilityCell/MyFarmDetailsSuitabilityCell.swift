//
//  MyFarmDetailsSuitabilityCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsSuitabilityCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    func setupUI() {
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        progressView.tintColor = .midGreenTwo
    }
    
}
