//
//  AddPostCell.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import UIKit

class AddPostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    
    func setupUI(model: AddPostModel) {
        titleLabel.text = model.title
        selectionLabel.text = model.selectionTitle
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        selectionLabel.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        selectionLabel.textColor = .blueyGreyTwo
    }
}
