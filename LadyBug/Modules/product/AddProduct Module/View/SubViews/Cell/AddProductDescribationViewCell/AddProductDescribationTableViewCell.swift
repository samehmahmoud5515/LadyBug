//
//  AddProductDescribationTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProductDescribationTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptiontextView: StandardTextFieldView!

    func setupUI(header: String, title: String){
        descriptiontextView.setupUI(isPasswordField: false, placeholder: header , nextButton: true)
        descriptiontextView.setupFloatingTitle(with: title)
        descriptiontextView.setupSpacing(insets: .zero)
    }
}
