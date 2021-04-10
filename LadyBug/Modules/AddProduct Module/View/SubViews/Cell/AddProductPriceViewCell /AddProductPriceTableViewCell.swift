//
//  AddProductDescribationTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProductPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var PriceView: StandardTextFieldView!
    
    func setUI( model : AddProductModel ){
        PriceView.setupUI(isPasswordField: false, placeholder: model.header , nextButton: true)
        PriceView.setupFloatingTitle(with: model.titile)
        PriceView.setupSpacing(insets: .zero)
        
        
    }
}
