//
//  YourProductsCellTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import UIKit

class YourProductsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currencylabel: UILabel!
    
    func setup( products : Products){
           productTitleLabel.text = products.name
           productDescriptionLabel.text = products.description
           cityLabel.text = products.city
           guard let price = products.price else {return}
           priceLabel.text = String(price)
           setupUI()
       }
    
    func setupUI() {
        productTitleLabel.textColor = .purplishBrown
        productTitleLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        productDescriptionLabel.textColor = .purplishBrown
        productDescriptionLabel.font = UIFont.get(enFont: .light(10), arFont: .light(10))
        
        priceLabel.textColor = .midGreenTwo
        priceLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        currencylabel.textColor = .midGreenTwo
        currencylabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        
        cityLabel.textColor = .midGreenTwo
        cityLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
}
