//
//  AddPostTextViewCell.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

class AddPostTextViewCell: UITableViewCell {

    @IBOutlet weak var textView: StandardTextView!
        
    func setupUI(textViewUpdateDelegate: TextViewUpdateProtocol?) {
        textView.textViewUpdateDelegate = textViewUpdateDelegate
    }
}
