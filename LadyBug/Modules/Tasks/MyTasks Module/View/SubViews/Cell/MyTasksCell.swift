//
//  MyTasksCell.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import UIKit

class MyTasksCell: UITableViewCell {

    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var selectionImageView: UIImageView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescLabel: UILabel!
    @IBOutlet weak var taskValueLabel: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var taskDateLabel: UILabel!
    @IBOutlet weak var taskDescCompletedLine: UIView!
    
    func setupUI(task: TodayTask) {
        let isDone = task.done ?? false
        taskTitleLabel.text = task.name
        taskDescLabel.text = task.taskTypeName
        taskDateLabel.text = task.dueAt?.toDate?.toDisplayString
        taskValueLabel.text = "\(task.quantity ?? 0)"
        notificationButton.setTitle(task.dueAt?.toDate?.toDisplayString, for: .normal)
        
        taskTitleLabel.textColor = !isDone ? .purplishBrownTwo : .blueyGreyTwo
        taskDescLabel.textColor = !isDone ? .purplishBrownTwo : .blueyGreyTwo
        taskDescLabel.textColor = .purplishBrownTwo
        taskDateLabel.textColor = .blueyGreyTwo
        taskDateLabel.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        taskTitleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        taskDescLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        taskDescLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        notificationButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        selectionView.backgroundColor = isDone ? .midGreenTwo : .paleGrey
        selectionView.layer.borderWidth = isDone ? 0 : 1.5
        selectionView.layer.borderColor = UIColor.blueyGreyTwo.cgColor
        selectionImageView.isHidden = !isDone
        taskDescCompletedLine.isHidden = !isDone
    }
    
    
}
