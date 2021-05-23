//
//  AddProductDescribationTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

protocol AddProductDescriptionCellDelegate: class {
    func didChangeText(text: String, cell: AddProductDescriptionCell)
}

class AddProductDescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptiontextView: StandardTextFieldView!
    
    weak var delegate: AddProductDescriptionCellDelegate?

    func setupUI(header: String, title: String) {
        descriptiontextView.setupUI(isPasswordField: false, placeholder: header , nextButton: true)
        descriptiontextView.setupFloatingTitle(with: title)
        descriptiontextView.setupSpacing(insets: .zero)
        descriptiontextView.delegate = self
    }
}

extension AddProductDescriptionCell: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
        
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        delegate?.didChangeText(text: text, cell: self)
    }    
}
