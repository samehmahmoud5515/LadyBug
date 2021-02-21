//
//  MoreMenuLanguageCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/20/21.
//

import UIKit

class MoreMenuLanguageCell: UITableViewCell {
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageTitleLabel: UILabel!
    @IBOutlet weak var languageButtonTitle: UILabel!
    @IBOutlet weak var languageArrow: UIImageView!
    
   func setupUI(model: MoreMenuNotificationModel) {
          notificationswitchButton.isOn = model.isNotificationOn
          notificationsLabel.text = model.title
          notificationsImageView.image = UIImage(named: model.image)
    }
    
}
