//
//  AddPostDescriptionCell.swift
//  LadyBug
//
//  Created by Sameh on 2/23/21.
//

import UIKit

class AddPostDescriptionCell: UITableViewCell {
    @IBOutlet weak var addPostDescripationTextView: UITextView!
    @IBOutlet weak var addPostDescriptionLabel: UILabel!
    
    func setupCell(model: AddPostDescription){
        addPostDescripationTextView.text = model.text
        addPostDescriptionLabel.text = model.title
        setupFont()
        setupColor()
    }
    
    private func setupFont(){
        addPostDescriptionLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addPostDescripationTextView.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
    }
    private func setupColor(){
       
    }
    
    
}
