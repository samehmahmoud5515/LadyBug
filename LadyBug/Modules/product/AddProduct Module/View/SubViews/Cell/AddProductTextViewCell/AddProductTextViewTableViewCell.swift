//
//  AddProductTextViewTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/9/21.
//

import UIKit

protocol AddProductTextViewTableViewCellDelegate: class {
    func textViewChanged(text: String, _ cell: AddProductTextViewTableViewCell)
}

class AddProductTextViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: StandardTextView!
    
    weak var delegate: AddProductTextViewTableViewCellDelegate?
    
    func setupUI() {
        textView.textViewUpdateDelegate = self
        textView.textView.isScrollEnabled = true
    }
}

extension AddProductTextViewTableViewCell: TextViewUpdateProtocol {
    func textViewChanged(text: String, _ textView: StandardTextView) {
        delegate?.textViewChanged(text: text, self)
    }
}
