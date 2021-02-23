//
//  MoreMenuLanguageCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/20/21.
//

import UIKit

class MoreMenuLanguageCell: UITableViewCell {
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageTitleLabel: UILabel!
    @IBOutlet weak var languageButtonTitle: UILabel!
    @IBOutlet weak var languageArrow: UIImageView!
    
    func setupUI(model: MoreMenuLanguageModel) {
        languageButtonTitle.text = model.language
        languageTitleLabel.text = model.title
        languageImageView.image = UIImage(named: model.image)
        setupFonts()
    }
    private func setupFonts(){
        languageButtonTitle.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        languageTitleLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
    }
}
