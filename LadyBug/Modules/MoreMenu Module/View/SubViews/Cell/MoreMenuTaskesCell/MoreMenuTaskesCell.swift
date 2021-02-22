//
//  MoreMenuTaskesCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/20/21.
//

import UIKit

class MoreMenuTaskesCell: UITableViewCell {
    @IBOutlet weak var taskesImageView: UIImageView!
    @IBOutlet weak var taskesLabel: UILabel!
    @IBOutlet weak var taskesarrowIamgeView: UIImageView!
    
    func setupUI(model: MoreMenuModel) {
        taskesImageView.image = UIImage(named: model.image)
        taskesLabel.text = model.title
        setupFonts()
    }
    private func setupFonts(){
        taskesLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
    }
    
}
