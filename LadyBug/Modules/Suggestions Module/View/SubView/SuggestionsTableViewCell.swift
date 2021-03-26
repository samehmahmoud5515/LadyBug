//
//  SuggestionsTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/25/21.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionsArrow: UIImageView!
    @IBOutlet weak var suggestionCropsLabel: UILabel!
    @IBOutlet weak var suggestionsCropsImage: UIImageView!
    
    func setupUI(model : SuggestionsModel) {
           suggestionsCropsImage.image = UIImage(named: model.image)
        suggestionCropsLabel.text = model.title
           setupFonts()
       }
       private func setupFonts(){
           suggestionCropsLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
       }
    
}
