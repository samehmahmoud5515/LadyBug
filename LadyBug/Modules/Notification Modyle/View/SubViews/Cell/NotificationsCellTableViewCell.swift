//
//  NotificationsCellTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/24/21.
//

import UIKit

class NotificationsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationCoranerView: UIView!
    @IBOutlet weak var notificationHeaderTitle: UILabel!
    @IBOutlet weak var notificationTimeTitle: UILabel!
    @IBOutlet weak var notificationContentTitle: UITextView!
    @IBOutlet weak var notificationSubjectTitle: UILabel!
    
    func setupCell(){
        notificationHeaderTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        notificationTimeTitle.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        notificationSubjectTitle.font  = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        notificationContentTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
    }
    
    
}
