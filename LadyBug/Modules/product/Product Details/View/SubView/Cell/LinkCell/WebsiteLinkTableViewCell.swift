//
//  WebsiteLinkTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/20/21.
//

import UIKit

class WebsiteLinkTableViewCell: UITableViewCell {
    @IBOutlet weak var moreLinkesLabel: UILabel!
    @IBOutlet weak var pressHereLabelButton: UIButton!
    
    weak var delegate : ProductDetailsOtherLinkProtocol?
    
    func setupFontUI() {
        pressHereLabelButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        moreLinkesLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    func setupUI(model: ProductInfo ) {
        moreLinkesLabel.text = model.title
        pressHereLabelButton.setTitle(model.Content, for: .normal)
        setupFontUI()
    }
    
    @IBAction func PressHereActionButton(_ sender: UIButton) {
        delegate?.otherLinkButtonDidTapped(self)
    }
}


