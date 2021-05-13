//
//  AddPostCell.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import UIKit

class AddPostCell: UITableViewCell {

    @IBOutlet weak var selectionView: StandardSelectionView!
    
    func setupUI(model: AddPostModel) {
        selectionView.setupUI(title: model.title, selectionTitle: model.selectionTitle)
    }
}
