//
//  AddProductSelectionTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProductSelectionTableViewCell: UITableViewCell {

  @IBOutlet weak var selectionView: CustomSelectionView!
    
    func setupUI(model: AddProductModel) {
        selectionView.setupUI(title: model.header, placeholder: model.titile, arrowImage: "common_arrow_left_ic")
    }
}
