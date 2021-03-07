//
//  MyFarmDetailsTaskCell.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class MyFarmDetailsTaskCell: UITableViewCell {

    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescLabel: UILabel!
    @IBOutlet weak var taskValueLabel: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var taskDateLabel: UILabel!
    
    func setupUI(isSelected: Bool) {
        taskTitleLabel.textColor = !isSelected ? .purplishBrownTwo : .blueyGreyTwo
        taskDescLabel.textColor = !isSelected ? .purplishBrownTwo : .blueyGreyTwo
        taskDescLabel.textColor = .purplishBrownTwo
        taskDateLabel.textColor = .blueyGreyTwo
        taskDateLabel.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        taskTitleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        taskDescLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        taskDescLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        notificationButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        selectionView.backgroundColor = isSelected ? .midGreenTwo : .paleGrey
        selectionView.layer.borderWidth = isSelected ? 0 : 1.5
        selectionView.layer.borderColor = UIColor.lightBlueGreyTwo.cgColor
        selectionImageView.isHidden = !isSelected
    }
}
