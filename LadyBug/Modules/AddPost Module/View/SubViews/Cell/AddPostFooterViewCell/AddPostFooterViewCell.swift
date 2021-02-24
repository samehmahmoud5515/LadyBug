//
//  AddPostFooterViewCell.swift
//  LadyBug
//
//  Created by Sameh on 2/24/21.
//

import UIKit

class AddPostFooterViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addPostIamgeFootterImageView: UIImageView!
    var titleLabel :String = ""
    func setupUI(model: FooterViewUIModel) {
        titleLabel = model.title
        addPostIamgeFootterImageView.image = UIImage(named: model.image)
        }
    }



