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
    
    func setupSelecttion(isSelected: Bool){
        notificationCoranerView.backgroundColor = isSelected ? .midGreenTwo : .paleGrey
               notificationCoranerView.layer.borderWidth = isSelected ? 0 : 1.5
               notificationCoranerView.layer.borderColor = UIColor.blueyGreyTwo.cgColor
    }
    
    func setupCell( notification : Notification){
        notificationHeaderTitle.text = notification.title
        notificationTimeTitle.text = notification.createdAt
        notificationContentTitle.text = notification.body
        notificationSubjectTitle.text = notification.type
       
        setupUI()
    }
    
    func  setupUI(){
        
        notificationHeaderTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        notificationTimeTitle.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        notificationSubjectTitle.font  = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        notificationContentTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        notificationCoranerView.layer.maskedCorners = [.layerMaxXMaxYCorner  , .layerMaxXMinYCorner ]
        notificationCoranerView.layer.cornerRadius = CGFloat(8.0)
        notificationCoranerView.clipsToBounds = true
        
    }
    
}
