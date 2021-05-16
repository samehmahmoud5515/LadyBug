//
//  AddProductDescribationTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProductDescribationTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptiontextView: StandardTextFieldView!

    func setUI( model : AddProductModel ){
        descriptiontextView.setupUI(isPasswordField: false, placeholder: model.header , nextButton: true)
        descriptiontextView.setupFloatingTitle(with: model.titile)
        descriptiontextView.setupSpacing(insets: .zero)
        
        
    }
}
