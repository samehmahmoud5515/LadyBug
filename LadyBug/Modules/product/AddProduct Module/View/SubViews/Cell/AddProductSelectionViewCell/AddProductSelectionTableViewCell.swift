//
//  AddProductSelectionTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

protocol AddProductSelectionTableViewCellSelectionDelegate: class {
    func didSelectItem(item: String, cell: AddProductSelectionTableViewCell)
}

class AddProductSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var selectionView: StandardSelectionView!
    
    weak var delegate: AddProductSelectionTableViewCellSelectionDelegate?
    
    func setupUI(header: String, title: String) {
        selectionView.setupUI(title: header, selectionTitle: title, placeholderColor: .purplishBrown)
        selectionView.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
}

extension AddProductSelectionTableViewCell: StandardSelectionViewDelegate {
    func didSelectItem(item: String) {
        delegate?.didSelectItem(item: item, cell: self)
    }
}
