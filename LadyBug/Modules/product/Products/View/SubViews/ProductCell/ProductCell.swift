//
//  ProductCell.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pricevalue: UILabel!
    
    func setup( products : Product){
        productTitleLabel.text = products.name
        productDescriptionLabel.text = products.description
        cityLabel.text = products.city
        guard let price = products.price else {return}
        pricevalue.text = String(price)
        setupUI()
    }
    
    func setupUI() {
        productTitleLabel.textColor = .purplishBrown
        productTitleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        productDescriptionLabel.textColor = .purplishBrown
        productDescriptionLabel.font = UIFont.get(enFont: .light(10), arFont: .light(10))
        
        priceLabel.textColor = .midGreenTwo
        priceLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        pricevalue.textColor = .midGreenTwo
        pricevalue.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        cityLabel.textColor = .midGreenTwo
        cityLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    
}
