//
//  MoreMenuNotificationsCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/20/21.
//

import UIKit

class MoreMenuNotificationsCell: UITableViewCell {

    @IBOutlet weak var notificationsImageView: UIImageView!
    @IBOutlet weak var notificationsLabel: UILabel!
    @IBOutlet weak var notificationswitchButton: UISwitch!
    
    
    func setupUI(model: MoreMenuNotificationModel , data : User  ) {
        notificationswitchButton.isOn = model.isNotificationOn
        notificationsLabel.text = model.title
        notificationsImageView.image = UIImage(named: model.image)
        guard let isNotifiable = data.isNotifiable else{return}
        notificationswitchButton.isOn = isNotifiable
        setupFonts()
       }
    private func setupFonts(){
        notificationsLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))    }
}
