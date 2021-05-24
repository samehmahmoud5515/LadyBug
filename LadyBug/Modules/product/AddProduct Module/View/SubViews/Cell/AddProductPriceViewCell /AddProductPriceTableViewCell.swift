//
//  AddProductDescribationTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

protocol AddProductPriceTableViewCellProtocol: class {
    func didChangeText(text: String, _ cell: AddProductPriceTableViewCell)
}

class AddProductPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var priceView: StandardTextFieldView!
    weak var delegate: AddProductPriceTableViewCellProtocol?
    
    func setUI(model: AddProductModel) {
        priceView.setupUI(isPasswordField: false, placeholder: model.header, nextButton: true)
        priceView.setupFloatingTitle(with: model.titile)
        priceView.setupSpacing(insets: .zero)
        priceView.delegate = self
    }
}

extension AddProductPriceTableViewCell: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        delegate?.didChangeText(text: text, self)
    }
}
