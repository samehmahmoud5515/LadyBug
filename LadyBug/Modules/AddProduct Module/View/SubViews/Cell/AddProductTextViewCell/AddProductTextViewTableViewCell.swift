//
//  AddProductTextViewTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProductTextViewTableViewCell: UITableViewCell {
    
       @IBOutlet weak var textView: StandardTextView!
        
    func setupUI(textViewUpdateDelegate: TextViewUpdateProtocol?) {
        textView.textViewUpdateDelegate = textViewUpdateDelegate
    }
}
